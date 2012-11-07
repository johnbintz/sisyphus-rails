require "sisyphus-rails/version"
require "sisyphus-rails/engine"
require "sisyphus-rails/form_helper"
require "sisyphus-rails/form_tag_helper"

module Sisyphus
  mattr_accessor :process
  mattr_accessor :app_root
  mattr_accessor :config
  mattr_accessor :form_builder
  
  def self.setup
    yield self
  end

  class FormBuilder
    def initialize(template)
      @template = template
    end

    def status
      @template.content_tag(:div, message.html_safe, :class => 'sisyphus_status', :style => 'display: none')
    end

    def message
      @template.t('sisyphus.autosaved_content') << @template.content_tag(:button, @template.t('sisyphus.revert'))
    end
  end

  Sisyphus.form_builder = Sisyphus::FormBuilder
end
