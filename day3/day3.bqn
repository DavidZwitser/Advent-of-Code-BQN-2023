f ← >•file.Lines "data.txt"
t ← f

GroupNeighbours ← (¬-˜⊢×·+`»⊸>)⊸⊔
IsNmbr 			← ≥⟜'0'∧≤⟜'9'
IsSymbol 		← ≠⟜' ' ∧ ¬∘IsNmbr ∧ ≠⟜'.'
Snip 			← {[start,end]𝕊arr: start ↓ (end+1) ↑ arr}
Indc 			← /○⥊⟜(↕≢) # Get the indicies

boxes ← ∾⥊(↕≠t) {
	𝕨⊸≍˘¨ (⊑≍(⊑⌽))¨ GroupNeighbours⟜(↕≠) IsNmbr 𝕩
}¨ ⋈˘ t

Nmbrs ← t⊸{
	valid 	← +´+´˘ IsSymbol area ← (0 ⌈ ¯1‿1 + 𝕩) Snip 𝕨
	nmbr 	← valid × •ParseFloat ⊏ 𝕩 Snip 𝕨
}
pt1 ← +´ Nmbrs¨ boxes

ValsWithStars ← {≢⟜@¨⊸/ t⊸{
	cutout 	← 0 ⌈ ¯1‿1 + 𝕩
	valid 	← +´+´˘ IsSymbol area ← cutout Snip 𝕨
	nmbr 	← valid × •ParseFloat ⊏ 𝕩 Snip 𝕨
	stars 	← (⊏cutout)⊸+¨ Indc '*' = area

	{0<≠stars ? nmbr‿stars ; @}
}¨ 𝕩}

MultiplyMatchingStars ← {
	match_matrix 	← (∨´∨˝)∘(≡⌜)○(1⊸⊑)⌜˜𝕩
	indicies 		← <´¨⊸/ /○⥊⟜(↕≢) match_matrix
	values 			← ⊑¨¨ ⊑⟜𝕩⚇0 indicies
	multiplications ← >×˝¨ values
}

pt2 ← +´ MultiplyMatchingStars ValsWithStars boxes
