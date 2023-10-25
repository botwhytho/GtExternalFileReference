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
				at: 'gtExternalFileReference'
				put: [ :parser | 
					parser
						spawnParser: LeExternalFileReferenceParser
						startingAt: LeExternalFileReferenceParser startingStateForExternalFileReferenceAnnotation ] ]
]
