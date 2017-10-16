# # Nkss: Helpers
# A bunch of helpers you can use in your styleguides.

module StyleguideHelper

  DEFAULT_OPTIONS = {
    :background => 'light',
    :align => 'left',
    :code => 'true'
  }.freeze

  # ### kss_block
  # Documents a styleguide block.
  #
  # Some options you can specify:
  #
  #  * `background` - The background color. Can be *clear*, *white*, *black*,
  #  *light*, or *dark*.
  #
  #  * `align` - Text alignment. Can be *left*, *right*, or *center*.
  #
  #  * `width` - (Optional) width for the inner area. Specify this for
  #  documenting long things.
  #
  # Example:
  #
  #     = kss_block '1.1' do
  #       %div.foo
  #         Put markup here!
  #
  # Example with options:
  #
  #     = kss_block '1.1', background: 'dark' do
  #       %div.foo
  #         Put markup here!

  def kss_block(section_id, options={}, &block)
    section = @styleguide.section(section_id)

    raise "Section '#{section_id}' not found."  unless section.filename

    options = DEFAULT_OPTIONS.merge(options)

    inner_style = ''
    inner_style = "width: #{options[:width]}px; margin: 0 auto"  if options[:width]

    render \
      partial: 'styleguides/block',
      locals: {
        canvas_class: %W(bg-#{options[:background]} align-#{options[:align]}),
        code_block: block,
        html: capture(&block),
        source: capture_source(section_id, block),
        source_language: source_language(block),
        section: section,
        modifiers: (section.modifiers rescue Array.new),
        options: options,
        inner_style: inner_style,
      }
  end

  # ### kss_specimen
  # Renders a type specimen. This is great for demoing fonts.
  # Use it like so:
  #
  #     = kss_block '2.1' do
  #       .proxima-nova
  #         = kss_specimen
  #
  # This gets you a `<div class='sg-specimen'>` block which has already been
  # styled to showcase different sizes of the given font.

  def kss_specimen
    render partial: 'styleguides/specimen'
  end

  # ### kss_swatch
  # Renders a type specimen. This is great for demoing colors.
  #
  #     = kss_block '2.1' do
  #       = kss_swatch 'red', '#ff3322', description: 'for error text'

  def kss_swatch(name, color, options={})
    render partial: 'styleguides/swatch', locals: {
      name: name,
      identifier: name,
      color: color,
      dark: options[:dark],
      description: options[:description]
    }
  end

  # ### lorem
  # Convenient lorem ipsum helper.
  #
  # Yeah, well, you'll need this for a lot of styleguide sections. Use it like
  # so:
  #
  #     %p= lorem.paragraph
  #     %li= lorem.sentence
  #
  def lorem
    require 'ffaker'

    FFaker::Lorem
  end

  # ### markdown
  # Markdownify some text.

  def markdown(text)
    require 'bluecloth'

    str = BlueCloth.new(text).to_html
    str = str.html_safe  if str.respond_to?(:html_safe)
    str
  end

  protected

  def capture_source(section_id, block)
    file, _ = block.source_location # line doesn't always work correctly
    lines = File.read(file).split("\n")
    line = lines.
      index { |o| !! o.match(/kss_block[ (]["']#{section_id}['"][ )]/) }
    unless line
      raise IndexError, "kss_block '#{section_id}' not found in #{file}"
    end
    target_indent = lines[line].index(/[^\s]/) # level of the kss_block call
    remove_indent = lines[line + 1].index(/[^\s]/) - target_indent
    lines = lines[line + 1, lines.length]  # ignore anything before the call
    [].tap do |content|
      while current_line = lines.shift
        if current_line.strip.present?
          break if current_line.index(/[^\s]/) <= target_indent
        end
        content << current_line.gsub(/^\s{#{remove_indent}}/,'')
      end
    end.join("\n")
  end

  def source_language(block)
    file, _ = block.source_location
    file.split('.').last if file.is_a? String
  end

end
