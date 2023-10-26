Class {
	#name : #LeExternalFileReferenceScanner,
	#superclass : #SmaCCScanner,
	#category : #GtExternalFileReference
}

{ #category : #'generated-initialization' }
LeExternalFileReferenceScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(7 'end' 5) #(7 'path' 6) #(7 'start' 4))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
LeExternalFileReferenceScanner >> emptySymbolTokenId [
	^ 16
]

{ #category : #generated }
LeExternalFileReferenceScanner >> errorTokenId [
	^ 17
]

{ #category : #generated }
LeExternalFileReferenceScanner >> scanForToken [
	self step.
	currentCharacter == $= ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $| ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(2 7).
			self step.
			currentCharacter isDigit ] whileTrue.
			(currentCharacter <= $<
				or: [ (currentCharacter between: $> and: ${) or: [ currentCharacter >= $~ ] ])
				ifTrue: [ [ self recordMatch: #(7).
					self step.
					currentCharacter <= $<
						or: [ (currentCharacter between: $> and: ${) or: [ currentCharacter >= $~ ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	(currentCharacter <= ${ or: [ currentCharacter >= $~ ])
		ifTrue: [ [ self recordMatch: #(7).
			self step.
			currentCharacter <= $<
				or: [ (currentCharacter between: $> and: ${) or: [ currentCharacter >= $~ ] ] ]
				whileTrue ].
	^ self reportLastMatch
]
