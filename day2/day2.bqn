f←•file.Lines "./data.txt"

colors 	← "red"‿"green"‿"blue"
maxes 	← 12‿	13‿		14

Split ← {(+`𝕨⊸⍷)⊸⊔𝕩}

GetColorValue ← {grab𝕊color:
	∨´ m ← color ⍷ grab ?
		end_i 	← -⟜1 ⊑/ m
		start_i ← +⟜1 ⊑⌽/ ' ' = end_i ↑ grab
		•ParseFloat start_i ↓ end_i ↑ grab
	; 0
}
RoundInvalid ← {𝕊round:
	grabs ← ';' Split round
	∨´ {∨´ maxes < 𝕩⊸GetColorValue¨ colors }¨ grabs
}
MinimumHand ← {𝕊round:
	grabs ← ';' Split round
	×´ ⌈´ {𝕩⊸GetColorValue¨ colors }¨ grabs
}

pt1 ← +´ /0∾ ¬RoundInvalid¨ f
pt2 ← +´ MinimumHand¨ f

•Out¨ "Part 1: "‿"Part 2: " ∾¨ •Fmt¨ pt1‿pt2
