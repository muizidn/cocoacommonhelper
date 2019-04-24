# NibFileCompanion

Avoid writing
```swift
let nib = UINib...
let view = nib.instantiate(withOwner...
```

but write
```swift
class <CLASSNAME>: UIView, NibFileCompanion {}
// Make <CLASSNAME>.xib file

let view = <CLASSNAME>(index: 0, bundle: .main)
```

### Example

```swift
class CustomView: UIView, NibFileCompanion {}
```

**XIB**
View1: CustomView
View2: CustomView
View3: UIView
