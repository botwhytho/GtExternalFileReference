Class {
	#name : #MyColorParseNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'spaces',
		'color'
	],
	#category : #'MyCustomAnnotationTestPackage-Annotations'
}

{ #category : #generated }
MyColorParseNode >> acceptVisitor: aColorParseVisitor [
	^ aColorParseVisitor visitColorParse: self
]

{ #category : #generated }
MyColorParseNode >> color [
	^ color
]

{ #category : #generated }
MyColorParseNode >> color: aSmaCCToken [
	color := aSmaCCToken
]

{ #category : #generated }
MyColorParseNode >> compositeTokenVariables [
	^ #(#spaces)
]

{ #category : #'generated-initialize-release' }
MyColorParseNode >> initialize [
	super initialize.
	spaces := OrderedCollection new: 2.
]

{ #category : #generated }
MyColorParseNode >> spaces [
	^ spaces
]

{ #category : #generated }
MyColorParseNode >> spaces: anOrderedCollection [
	spaces := anOrderedCollection
]

{ #category : #generated }
MyColorParseNode >> tokenVariables [
	^ #(#color)
]
