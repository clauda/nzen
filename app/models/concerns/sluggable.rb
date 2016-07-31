module Sluggable
  extend ActiveSupport::Concern

  included do
    after_create :slug_me
  end

  def self.included(base)
    base.class_eval do

      def self.by_slug id
        begin
          find_by(permalink: id) if id
        rescue ActiveRecord::RecordNotFound
          return nil
        end
      end

    end
  end

  def to_param
    self.permalink
  end

  def slug_me
    if self.class.by_slug(self.name.parameterize) || blacklist.include?(self.name.parameterize)
      if self.respond_to?(:district)
        self.update(permalink: "#{self.id.to_s}-#{self.name.parameterize}-#{self.district.permalink}")
      else
        self.update(permalink: "#{self.id.to_s}-#{self.name.parameterize}")
      end
    else
      self.update(permalink: self.name.parameterize)
    end
  end

  def blacklist
    [ 'cidades', 'explore', 'lojas-e-servicos', 'anuncie', 'busca', 
      'natal-rn', 'parnamirim-rn', 
      'pin', 'pinou' ]
  end

end