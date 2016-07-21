module Sluggable
  extend ActiveSupport::Concern

  included do
    before_create :slug_me
  end

  def self.included(base)
    base.class_eval do

      def self.by_slug id
        begin
          find_by(permalink: id) if id
        rescue Mongoid::Errors::DocumentNotFound
          return nil
        end
      end

    end
  end

  def to_param
    self.permalink
  end

  def slug_me
    self.permalink = self.name.parameterize
  end

end