class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  # newアクションから入力内容を受け取り確認画面を生成
  # 入力内容にエラーがあれば前の画面へ戻す
  # sendボタンが押されたらcreateアクションを実行
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end
  
  # 定義することで入力内容を保持したまま前のページに戻る
  def back
    @contact = Contact.new(contact_params)
    render :new
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
