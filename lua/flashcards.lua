-- Default Mappings:
--
--     n, l: Goto next flashcard.
--     b, h: Goto previous flashcard.
--     f, enter, space: Flip flashcard.
--     k: Toggle whether you know the card or not.
--     a: Add a new flashcard. A window will popup for you to enter the term, then another to enter the definition.
--     e: Edit current side of flashcard.
--     d: Delete the current flashcard.
--     o: Browse all subjects.
require("flashcards").setup({
	dir = "/mnt/e/flashcards",
})
