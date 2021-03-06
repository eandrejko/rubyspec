require 'matrix'

describe :inverse, :shared => true do

  it "returns a Matrix" do
    Matrix[ [1,2], [2,1] ].send(@method).should be_an_instance_of(Matrix)
  end

  it "returns the inverse of the Matrix" do
    Matrix[
      [1, 3, 3],     [1, 4, 3],  [1, 3, 4]
    ].send(@method).should ==
    Matrix[
      [7, -3, -3],   [-1, 1, 0], [-1, 0, 1]
    ]
  end

  ruby_bug "?", "1.8.7" do
    it "returns the inverse of the Matrix (other case)" do
      Matrix[
        [1, 2, 3],    [0, 1, 4],     [5, 6, 0]
      ].send(@method).should be_close_to_matrix([
        [-24, 18, 5], [20, -15, -4], [-5, 4, 1]
      ])
    end
  end

  it "raises a ErrDimensionMismatch if the Matrix is not square" do
    lambda{ Matrix[ [1,2], [1] ].send(@method) }.should
      raise_error(Matrix::ErrDimensionMismatch)
  end

end
