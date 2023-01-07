class DealsController < ApplicationController
  before_action :set_deal, only: %i[ show edit update destroy ]

  # GET /deals or /deals.json
  def index
    redirect_to categories_url
  end

  # GET /deals/1 or /deals/1.json

  # GET /deals/new
  def new
    @deal = Deal.new
  end


  # POST /deals or /deals.json
  def create
    @deal = Deal.new(deal_params)
    @deal.author_id = current_user.id

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal.categories.first, notice: 'Transaction was successfully added.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1 or /deals/1.json
  def destroy
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to  @deal.categories.first, notice: "Deal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deal_params
      puts "My params !!!!!!!!!!!!!"
      params.require(:deal).permit(:name, :amount, :author_id, :category_id)
    end
end
