class BooksController < ApplicationController

  def index
    # 全Bookデータを取得し、インスタンスに格納
    @books = Book.all
    # 新規投稿用にインスタンスを作成
    @book = Book.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    book.save
    # トップ画面へリダイレクト
    redirect_to books_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
