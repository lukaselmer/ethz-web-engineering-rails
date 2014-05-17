require 'spec_helper'

feature 'The Flickr image sevice' do
  before :each do
    @flickr_service = FlickrService.new
  end

  scenario 'should not be nil' do
    expect(@flickr_service).not_to be(nil)
  end

  scenario 'should search images' do
    cars = @flickr_service.search('car')
    expect(cars).not_to be(nil)
    expect(cars.count).to be > 1
    expect(cars).to be_an_instance_of Array
  end

  scenario 'should do search images' do
    cars = @flickr_service.do_search('car')
    expect(cars).not_to be(nil)
    expect(cars.count).to be > 1
    expect(cars).to be_an_instance_of Array
  end

  scenario 'should have pagination' do
    cars = @flickr_service.do_search('car', 2)
    expect(cars).not_to be(nil)
    expect(cars.count).to be > 1
    expect(cars).to be_an_instance_of Array
  end

  scenario 'should generate link from photo hash' do
    hsh = {'id' => '1234567890', 'owner' => '21345@X53', 'secret' => '412345n12',
           'server' => '5345', 'farm' => 9, 'title' => 'OJfeöaewfoj, Bla',
           'ispublic' => 1, 'isfriend' => 0, 'isfamily' => 0}.symbolize_keys
    link = @flickr_service.convert_to_user_url(hsh)
    expect(link).to eq('http://www.flickr.com/photos/21345@X53/1234567890')
  end

  scenario 'should generate url from photo hash' do
    hsh = {'id' => '1234567890', 'owner' => '21345@X53', 'secret' => '412345n12',
           'server' => '5345', 'farm' => 9, 'title' => 'OJfeöaewfoj, Bla',
           'ispublic' => 1, 'isfriend' => 0, 'isfamily' => 0}.symbolize_keys
    url = @flickr_service.convert_to_url(hsh)
    expect(url).to eq('http://farm9.staticflickr.com/5345/1234567890_412345n12_c.jpg')
  end

end
