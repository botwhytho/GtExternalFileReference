Class {
	#name : #GtExternalFileReference,
	#superclass : #Object,
	#category : #GtExternalFileReference
}

{ #category : #initialization }
GtExternalFileReference class >> initialize [
	super initialize.
	(Smalltalk globals hasClassNamed: #LeParser)
		ifTrue: [ LeParser annotationParsers
				at: 'LeCheckbox'
				put: [ :parser | 
					parser
						spawnParser: LeCheckboxParser
						startingAt: LeCheckboxParser startingStateForCheckboxAnnotation ] ]
]
