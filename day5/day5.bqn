f ← •file.Lines "data.txt"

Split ← (⊢-˜+`×¬)∘=⊔⊢

seeds ← •ParseFloat¨ 1↓ ' ' Split ⊑f
maps ← >¨ •ParseFloat¨¨¨ ' ' Split¨¨ 2⊸↓¨ 1↓ (+`(0=≠)¨)⊸⊔ f

GetDistOfMatch ← {map𝕊seed:
	seed + +´{
		start ← 1⊑𝕩
		range ← 2⊑𝕩
		dist  ← (⊑-1⊸⊑)𝕩
		dist × (seed > start) ∧ seed < start + range
	}˘ map
}

StepTroughTransforms ← {seed𝕊maps:
	seed GetDistOfMatch´ ⌽maps
}

pt1 ← ⌊´ StepTroughTransforms⟜maps¨ seeds
