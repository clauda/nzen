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
    if self.class.by_slug(self.name.parameterize)
      self.update(permalink: "#{self.id.to_s}-#{self.name.parameterize}-#{self.district.permalink}")
    else
      self.update(permalink: self.name.parameterize)
    end
  end

end