module PromptsHelper

  def time_display(datetime)
    datetime.strftime("Created on %A, %m/%d/%Y")
  end
  
end
