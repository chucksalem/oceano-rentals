describe PropertiesController, vcr: true, focus: true do
  describe 'POST #index' do
    before { RedisClient.flushdb }

    context 'case 1' do
      let(:data) { { area: 'corona_del_sol', start_date: '3/28/2019', end_date: '3/30/2019', guests: '1' } }
      it 'returns http success' do
        get :index, params: data

        expect(response).to have_http_status(:success)
      end
    end

    context 'case 2' do
      let(:data) { { area: 'las_conchas', start_date: '3/28/2019', end_date: '3/30/2019', guests: '4' } }

      it 'returns http success' do
        get :index, params: data

        expect(response).to have_http_status(:success)
      end
    end

    context 'case 3' do
      let(:data) { { area: 'las_conchas', start_date: '3/28/2019', end_date: '3/31/2019', guests: '4' } }

      it 'returns http success' do
        get :index, params: data

        expect(response).to have_http_status(:success)
      end
    end
  end
end
