class PagesController < ApplicationController
 
layout "admin"

  def index
    @pages = Page.all
  end

  def show
   @page = Page.find(params[:id])
  end

  def create
     # Instantiate a new object using form parameters
     # If save fails, redisplat the form so user can fix problem
     # Save the object
     # If save succeeds, redirect to the index action
      @page=Page.new(params.require(:page).permit(:name,:position,:visible))
    if @page.save
      flash[:notice]= "Page created successfully"
      redirect_to(:action => :index)
    else
      render('new')
    end
  end

  def new
    @page = Page.new({:name => "Default"})
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
       # Find an existing object using form parameters
    @page=Page.find(params[:id])
    # Update the object
   if  @page.update_attributes(params.require(:page).permit(:name,:position,:visible))
      flash[:notice]= "Subject updated successfully"
       # if update succeeds, redirect to index action
      redirect_to(:action => :show, :id => params[:id])
    else
      # If update fails, redisplat the form so user can fix problem
      render('edit')
    end
  end

  def delete
    @page=Page.find(params[:id])
  end

  def destroy
    page=Page.find(params[:id])
    page.destroy

    flash[:notice]= "Page '#{page.name}' deleted successfully"
    redirect_to(:action => :index)
  end 
end
