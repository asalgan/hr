class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  def index
    @notes = Note.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.content = params[:note][:content]
    @note.applicant_id = params[:note][:applicant_id]
    respond_to do |format|
      if @note.save
        # format.html { redirect_to applicant_url(:id => params[:note][:applicant_id]), notice: 'Note was successfully created.' }
        format.js
      else
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

  private

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:content, :applicant_id)
    end
end
