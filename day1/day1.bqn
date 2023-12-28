f ← •file.Lines "data.txt"

names ← "zero"‿"one"‿"two"‿"three"‿"four"‿"five"‿"six"‿"seven"‿"eight"‿"nine"
NmbrNameToNmbr ← {𝕊 str:
	m 		← ⍷⟜str¨ names
	vals 	← /+´¨ m
	poss 	← ∾/¨ m

	str {≡⟜'0'𝕩}◶⟨⊢,⊣⟩¨ '0' + +´ vals {𝕨⌾(𝕩⊸⊑) (≠str)⥊0}¨ poss
}
Nbrs 		← /(≥⟜'0'∧≤⟜'9')
LR 			← (⊑∾(⊑⌽))
LRStr 		← { •ParseFloat ⊑⟜𝕩¨ LR Nbrs 𝕩 }

pt1 ← +´ LRStr¨ f
pt2 ← +´ LRStr¨ NmbrNameToNmbr¨ f

•Out¨ "Part 1: "‿"Part 2: " ∾¨ •Fmt¨ pt1‿pt2
