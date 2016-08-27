module Services
  class Search

    def initialize(query, sorting, page, options)
      @query = query.presence || '*'
      @sorting = sorting.presence || 'name'
      @page = page || 1
      @options = options || {}
    end

    def self.for(*attrs)
      @searcher = new(*attrs)
      @searcher.search
    end

    def search
      return [] if @query.blank?

      @filters ||= filters
      Service.search(@query,
                    where: filters,
                    include: includes,
                    order: order,
                    page: @page,
                    per_page: @options[:per_page] || 30,
                    misspellings: false,
                    aggs: [:category_id, :district_id])
    end

    def filters
      @filters = @options[:is_admin] ? {} : { published: true }
      @filters[:category_permalink] = @options[:category_id] if @options[:category_id]
      @filters[:district_permalink] = @options[:district_id] if @options[:district_id]
      @filters[:published] = false if @options[:waiting]
      @filters
    end

    def order
      case @sorting
      when 'name'             then { name: :asc }
      when 'created_at'       then { created_at: :desc }
      end
    end

    private

      def includes
        @options[:includes] ? @options[:includes] : []
      end

  end
end