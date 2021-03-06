module ApplicationHelper
  def login_helper style=""
   if current_user.is_a?(GuestUser)
     (link_to "Register", new_user_registration_path, class: style) +
     " ".html_safe + (link_to "Login", new_user_session_path, class: style)
   else
     link_to "Logout", destroy_user_session_path, method: :delete, class: style
   end
  end

  def source_helper (styles)
     if session[:source]
       greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{link_to 'contact me' , contact_path} if you'd like to work together."
       content_tag(:div, greeting.html_safe, class: styles )
     end
  end

  def copyright_generator
    @copyright = RadevViewTool::Renderer.copyright 'Damjan Radev', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About-me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
      {
        url: tech_news_path,
        title: 'Tech News'
      }

    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|

        nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
   end

   nav_links.html_safe
 end

 def active? path
   "active" if current_page? path
 end

 def alerts
   alert = (flash[:alert] || flash[:error] || flash[:notice])

   if alert
     alert_generator alert
   end
 end

 def alert_generator msg
   js add_gritter(msg, :title => "Damjan Radev Portfolio", sticky: false)
 end
end


# def sample_helper
#   content_tag(:div, ' My content', class: 'my_class')
# end

# def nav_helper style, tag_type
#   (content_tag(tag_type, (link_to 'Home', root_path), class: style)) +
#   (content_tag(tag_type, (link_to 'About me', about_me_path), class: style)) +
#   (content_tag(tag_type, (link_to 'Contact', contact_path), class: style)) +
#   (content_tag(tag_type, (link_to 'Blog', blogs_path), class: style)) +
#   (content_tag(tag_type, (link_to 'Portfolio', portfolios_path), class: style))
# end
