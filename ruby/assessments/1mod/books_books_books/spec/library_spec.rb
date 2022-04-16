require "./lib/library"
require "./lib/author"
require "./lib/book"

RSpec.describe Library do
  before(:each) do
    @dpl              = Library.new("Denver Public Library") 
    @harper_lee       = Author.new({
                                first_name: "Harper", 
                                last_name: "Lee"
                              })    
    @charlotte_bronte = Author.new({
                                first_name: "Charlotte", 
                                last_name: "Bronte"
                              })     
  end

  it 'exists' do
    expect(@dpl).to be_a(Library)
    expect(@dpl.name).to eq 'Denver Public Library'
    expect(@dpl.books).to eq []
    expect(@dpl.authors).to eq []

    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = @charlotte_bronte.write("The Professor", "1857") 
    villette  = @charlotte_bronte.write("Villette", "1853")  
    mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960") 
    
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)  

    expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
    expect(@dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    
    expected = {:start=>"1847", :end=>"1857"}

    expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq expected
   
    expected = {:start=>"1960", :end=>"1960"}
   
    expect(@dpl.publication_time_frame_for(@harper_lee)).to eq expected
  end

  it 'can checkout a book' do
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = @charlotte_bronte.write("The Professor", "1857") 
    mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960") 
    villette  = @charlotte_bronte.write("Villette", "1853")  
    
    expect(@dpl.checkout(mockingbird)).to eq false
    expect(@dpl.checkout(jane_eyre)).to eq false
    
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expect(@dpl.checkout(jane_eyre)).to eq true
    expect(@dpl.checked_out_books).to eq([jane_eyre])
    expect(@dpl.checkout(jane_eyre)).to eq false
    
    @dpl.return(jane_eyre)

    expect(@dpl.checked_out_books).to eq []
    expect(@dpl.checkout(jane_eyre)).to eq true
    expect(@dpl.checkout(villette)).to eq true    
    expect(@dpl.checked_out_books).to eq [jane_eyre, villette]

    expect(@dpl.checkout(mockingbird)).to eq true

    @dpl.return(mockingbird)    

    expect(@dpl.checkout(mockingbird)).to eq true  

    @dpl.return(mockingbird)  

    expect(@dpl.checkout(mockingbird)).to eq true    
    expect(@dpl.most_popular_book).to eq(mockingbird)
  end
end