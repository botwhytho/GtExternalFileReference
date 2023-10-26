Class {
	#name : #MyColorScanner,
	#superclass : #SmaCCScanner,
	#category : #'MyCustomAnnotationTestPackage-Annotations'
}

{ #category : #generated }
MyColorScanner >> emptySymbolTokenId [
	^ 5
]

{ #category : #generated }
MyColorScanner >> errorTokenId [
	^ 6
]

{ #category : #generated }
MyColorScanner >> scanForToken [
	self recordMatch: #(2).
	self step.
	(currentCharacter isSeparator or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(2).
			self step.
			currentCharacter isSeparator or: [ currentCharacter == Character pageUp ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter isLetter
		ifTrue: [ [ self recordMatch: #(1).
			self step.
			currentCharacter isLetter ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
MyColorScanner >> tokenActions [
	^ #(nil #whitespace)
]
