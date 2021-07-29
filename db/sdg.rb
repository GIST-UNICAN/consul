(1..9).to_a.shuffle.each do |code|
  SDG::Goal.where(code: code).first_or_create!
end

%w[
  1.1 1.2 1.3 1.4 1.5 1.A 1.B
  2.1 2.2 2.3 2.4 2.5 2.A 2.B 2.C
  3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 3.A 3.B 3.C 3.D
  4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.A 4.B 4.C
  5.1 5.2 5.3 5.4 5.5 5.6 5.A 5.B 5.C
  6.1 6.2 6.3 6.4 6.5 6.6 6.A 6.B
  7.1 7.2 7.3 7.A 7.B
  8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 8.10 8.A 8.B
  9.1 9.2 9.3 9.4 9.5 9.A 9.B 9.C
].each do |code|
  SDG::Target.where(code: code, goal: SDG::Goal.find_by!(code: code.split(".").first)).first_or_create!
end

SDG::Phase.kinds.values.each { |kind| SDG::Phase.where(kind: kind).first_or_create! }
