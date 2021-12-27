class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def confirm
    if params[:contact].nil?
      render :new
    else
      # 入力値のチェック
      @contact = Contact.new(contact_params)
      if @contact.invalid?
        #NG 入力画面を再表示
        render :new
      end
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

  # 送信完了画面
  def done
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :matter)
  end

end
