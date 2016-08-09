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
        self.update(permalink: "#{self.id}-#{self.name.parameterize}-#{self.district.permalink}")
      else
        self.update(permalink: "#{self.id}-#{self.name.parameterize}")
      end
    else
      self.update(permalink: self.name.parameterize)
    end
  end

  def blacklist
    [ 'cidades', 'explore', 'lojas-e-servicos', 'anuncie', 'busca', 
      'sitemaps', 'sitemaps-companies', 'conta',
      'natal-rn', 'parnamirim-rn', 'reportar-erro', 
      'pin', 'pinou', 'painel-de-negocios', 'remote' ]
  end

end