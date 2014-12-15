class SubjectsController < ApplicationController

  layout "admin"

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
     # Instantiate a new object using form parameters
     # If save fails, redisplat the form so user can fix problem
     # Save the object
     # If save succeeds, redirect to the index action
   
    @subject=Subject.new(params.require(:subject).permit(:name,:position,:visible))
    if @subject.save
      flash[:notice]= "Subject created successfully"
      redirect_to(:action => :index)
    else
      render('new')
    end
    
  end

  def edit
    @subject=Subject.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @subject=Subject.find(params[:id])
    # Update the object
   if  @subject.update_attributes(params.require(:subject).permit(:name,:position,:visible))
      flash[:notice]= "Subject updated successfully"
       # if update succeeds, redirect to index action
      redirect_to(:action => :show, :id => params[:id])
    else
      # If update fails, redisplat the form so user can fix problem
      render('edit')
    end

  end

  def delete
     @subject=Subject.find(params[:id])
  end

  def destroy
    subject=Subject.find(params[:id])
    subject.destroy
     
     flash[:notice]= "Subject '#{subject.name}' deleted successfully"
    redirect_to(:action => :index)

  end
end


# class SubjectsController < ApplicationController
  
#   layout false

#   def index
#     @subjects =Subject.sorted
#   end

#   def show
#     @subject=Subject.find(params[:id])
#   end

#   def new
#     @subject=Subject.new({:name => "Default"})
#   end

#   def create
#   #instantiate a new object using a form parameter
#     @subject=Subject.new(subject.params)
#     # Save the object
#     if(@subject.save)
#       #If the save succeeds, rediret to the index action
#       redirect_to(:action => 'index')
#     else
#       #If the save fails, redisplay the form so user can fix problems
#       render('new')
#     end

#   def edit
#   end

#   def delete
#   end

# private
  
#   def subject.params
#     # same as using params[:subject], except that it:
#     # -raises an error if: subject is not present
#     # - allows listed attributes to be mass-assigned
#     params.require(:subject).permit(:name, :position, :visible)
#   end


# end