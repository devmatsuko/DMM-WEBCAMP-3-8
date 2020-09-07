class BooksController < ApplicationController

  def index
    # 全Bookデータを取得し、インスタンスに格納
    @books = Book.all
    # 新規投稿用にインスタンスを作成
    @book = Book.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @book.save #保存が成功した場合
      # サクセスメッセージ
      flash[:success] = "Book was successfully created."
      # 詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else # 保存が失敗した場合
      @books = Book.all
      render action: :index
    end
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
    @book = Book.find(params[:id])
    # ページより取得したパラメータを上書きする
    if @book.update(book_params)
      # サクセスメッセージ
      flash[:success] = "Book was successfully updated."
      # 詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else # 保存が失敗した場合
      render action: :edit
    end
  end

  def destroy
    # 指定IDのレコードを取得する
    @book = Book.find(params[:id])
    if @book.destroy #削除が成功した場合
      # サクセスメッセージ
      flash[:success] = "Book was successfully destroyed."
      # 投稿一覧画面へリダイレクト
      redirect_to books_path
    else # 保存が失敗した場合
      @books = Book.all
      render action: :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
