# 288-struct
Different structures template for DeuxHuitHuit

## Aside Sticky
```struct-aside-sticky.xsl```
When you want 2 elements side by side, and one of them (aside) is sticky.
### Content
- Aside: The sticky element. Max height of viewport by default
- Main: Content that flows normally on the page.

## Drawer
```struct-aside-drawer.xsl```
When you want a drawer behavior. 
### Content
- Fake Trigger: Visually beside the *Trigger* but does not change slide state. Useful to add a button for exemple.
- Trigger: Changes the state of the slide
- Slide: The element that slides up or down