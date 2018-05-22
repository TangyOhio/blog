class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    render 'form'
  end

  def edit
    @page = Page.find(params[:id])
    render 'form'
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to pages_path
    else
      render 'form'
    end
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to pages_path
    else
      render 'form'
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end



  private

    def page_params
      params.require(:page).permit(:title, :author, :body)
    end
end
