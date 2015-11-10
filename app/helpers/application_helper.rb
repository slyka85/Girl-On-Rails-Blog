module ApplicationHelper

	class CodeRayify < Redcarpet::Render::HTML
	  def block_code(code, language)
	    CodeRay.scan(code, language).div
	       # CodeRay.scan(code, language).div(:line_numbers => :table)
	  end
	end

	def markdown(text)
	  coderayified = CodeRayify.new(:filter_html => true, 
	                                :hard_wrap => true)
	  options = {
	    :fenced_code_blocks => true,
	    :no_intra_emphasis => true,
	    :autolink => true,
	    :link_attributes => { rel: 'nofollow', target: "_blank" },
	    :strikethrough => true,
	    :space_after_headers => true, 
	    :lax_html_blocks => true,
	    :superscript => true
	  }
	  markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
	  markdown_to_html.render(text).html_safe
	end
end


# class CodeRayify < Redcarpet::Render::HTML
#     def block_code(code, language)
#         CodeRay.scan(code, language).div(:line_numbers => :inline)
#     end
# end

# def markdown(text)
#     coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)

#     language ||= :plaintext

#     options = {
#         :fenced_code_blocks => true,
#         :no_intra_emphasis => false,
#         :autolink => true,
#         :strikethrough => true,
#         :lax_html_blocks => true,
#         :superscript => true
#     }

#     markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
#     markdown_to_html.render(text).html_safe
#     end