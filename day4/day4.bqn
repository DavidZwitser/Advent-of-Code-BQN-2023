f ← >•file.Lines "data.txt"
t ← 20↑f
t↩f

Split ← (⊢-˜+`×¬)∘=⊔⊢
Double ← ⌊·2⊸⋆ -⟜1

moves 	← (0≠≠¨)⊸/¨˘ ' ' Split¨˘ '|' Split˘ 10⊸↓˘ t
points 	← (+´∨˝)˘ ≡⌜´˘ moves

pt1 	← +´ Double¨ points

# Transform each scratchcard to lists of 1 the length of their points
# We're adding a 1 at each start to indicate their own count
expanded ← 1⊸∾˘ > (⌈´≠¨)⊸(↑¨) ⥊¨⟜1 points

# Add that list to the cards below nullifiing their own counts
# We're multiplying by the sign to mask out that values that should stay zero
# Then rotate and repeat untill all are processed
l ← ≠points
processed ← {1⌽ (×𝕩)× +⟜(0⌾⊑ l↑⊏) 𝕩}⍟l expanded

# Add all
pt2 ← +´⊑˘ processed

•Out¨ "Part 1: "‿"Part 2: " ∾¨ •Fmt¨ pt1‿pt2
