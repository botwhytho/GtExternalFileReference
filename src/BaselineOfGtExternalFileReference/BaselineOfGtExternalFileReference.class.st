Class {
	#name : #BaselineOfGtExternalFileReference,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtExternalFileReference
}

{ #category : #loading }
BaselineOfGtExternalFileReference class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'GtExternalFileReference' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtExternalFileReference >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtExternalFileReference'
		]
]
