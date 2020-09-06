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
    # 詳細画面へリダイレクト
    redirect_to books_path(book.id)
  end

  def show
    # 指定IDのレコードを取得する
    @book = Book.find(params[:id])
  end

  def edit
    # 指定IDのレコードを取得する
    @book = Book.find(params[:id])
  end

  def update
    # 指定IDのレコードを取得する
    book = Book.find(params[:id])
    # ページより取得したパラメータを上書きする
    book.update(book_params)
    # 詳細画面へリダイレクト
    redirect_to books_path(book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
