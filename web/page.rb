class Page < Erector::Widget
  needs :page_title => nil, :selection => nil
  
  def page_title
    @title || self.class.name
  end
  
  def selection
    @selection || page_title.downcase
  end
  
  def content
    html do
      head do
        title "Erector - #{page_title}"
        css "erector.css"
      end
      body do
        table do
          tr do
            td "valign" => "top" do
              widget Sidebar.new(:current_page => selection)
            end
            td "valign" => "top" do
              h1 :class => "title" do
                text "Erector - #{page_title}"
              end

              hr

              div :class => "body" do
                render_body
              end
            end
          end
        end
      end
    end
  end
  
  # override me
  def render_body
  end
end
