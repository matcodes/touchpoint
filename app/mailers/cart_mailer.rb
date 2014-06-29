class CartMailer < ActionMailer::Base
  default :from => "sales@touchpoint.com"

  PRODUCT_LABELS = {"trouser" => "Diesel Swim Trunks",
                    "glass" => "LV Sunglasses",
                    "wine" => "Dom Perignon Champagne",
                    "ipad" => "Apple iPad2"
                    }

  def quotation(user, products)
    @products = products
    @user = user
    @products.each{|p|
      attachments.inline["#{p}2.png"] = File.read(File.join(Rails.root, "app/assets/images/#{p}2.png"))
    }
    mail(:to => user.email, :from => "sales@touchpoint.com", :subject => "Touchpoint Shopping Cart!")
  end
end
