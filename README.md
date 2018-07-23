# 288-struct
Different structures template for DeuxHuitHuit


## Aside Sticky
```struct-aside-sticky.xsl```
When you want 2 elements side by side, and one of them (aside) is sticky.

#### Content
- Aside: The sticky element. Max height of viewport by default
- Main: Content that flows normally on the page.

---

## Drawer
```struct-drawer.xsl```
When you want a drawer behavior. 

#### Content
- Fake Trigger: Visually beside the *Trigger* but does not change slide state. Useful to add a button for exemple.
- Trigger: Changes the state of the slide
- Slide: The element that slides up or down

#### Dependencies
```
"modules/change-state.js",
"modules/slide.js",
"modules/auto-slide-click.js"
```

---

## Modal
```struct-modal.xsl```
Creates a modal, either for a page or a simple element.

#### Content
- Close: The element that will trigger a closing action
- Modal: The actual content of the modal

#### Dependencies
```
"modules/change-state.js",
"modules/auto-change-change-click.js"
```
