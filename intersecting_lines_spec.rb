require_relative "./intersecting_lines"

RSpec.describe "#merge_lines" do
  it "should intersect lines" do
    expect(merge_lines([[1,2], [3,3], [4,5], [6,10]])).to eq([[1,2], [3,3], [4,5], [6,10]])
  end

  it "should intersect lines [[1,2], [2,3]]" do
    expect(merge_lines([[1,2], [2, 3]])).to eq([[1, 3]])
  end

  it "should intersect lines [[1,4], [3,10]]" do
    expect(merge_lines([[1,4], [3, 10]])).to eq([[1, 10]])
  end

  it "should intersect lines [[2,4], [1,10]]" do
    expect(merge_lines([[2,4], [1, 10]])).to eq([[1, 10]])
  end

  it "should intersect lines" do
    expect(merge_lines([[1,6], [2,3], [6,6], [7,10]])).to eq([[1,6], [7,10]])
  end

  it "should intersect lines [[1,2], [2,4], [3,6], [7,10]]" do
    expect(merge_lines([[1,2], [2,4], [3,6], [7,10]])).to eq([[1,6], [7,10]])
  end

  it "should intersect lines [[1,3], [2,10], [3,5]]" do
    expect(merge_lines([[1,3], [2,10], [3,5]])).to eq([[1,10]])
  end
end
