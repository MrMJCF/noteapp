class NotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_note, only: [:show, :edit, :update, :destroy]
    before_action :note_owner, only: [:edit, :update, :destroy]
    
    
    def index
        @notes = Note.search(params[:search]).order('created_at DESC').includes(:user).paginate(page: params[:page], per_page: 8)
    end 
    
    def new
        @note = current_user.notes.build
    end
    
    def create 
        @note = current_user.notes.build(note_params)
        if @note.save
            redirect_to notes_path
        else 
            render 'new'
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update 
        if @note.update(note_params)
            redirect_to note_path(@note)
        else
            render 'edit'
        end
    end
    
    def destroy
        @note.destroy
        redirect_to notes_path
    end
    
    private
    
    # Only note owners can edit, update and destroy
    def note_owner
        unless @note.user_id == current_user.id
            flash[:notice] = 'Access denied'
            redirect_to notes_path
        end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :notes)
    end
    
end
