module ApplicationHelper

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
    end

    def zondicon(icon_name, options={})
        file = File.read(Rails.root.join('app', 'assets', 'images', "#{icon_name}.svg"))
        doc = Nokogiri::HTML::DocumentFragment.parse file
        svg = doc.at_css 'svg'
        options.each {|attr, value| svg[attr.to_s] = value}
        doc.to_html.html_safe
  end


end
