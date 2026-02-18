# CODING CONVENTION
*This is a fundamental guideline when working on codes in <strong>Kind-Talk/Client<strong> repository.*

## Naming Guideline
✅ **Variables:** Use desctiptive, intuitive names in `camelCase`.

✅ **Functions/Methods:** Use verbs in `camelCase`.

✅ **Classes/Objects:** Use `PascalCase`.

✅ **Constants:** Use all-uppercase with underbars. (e.g. `THIS_IS_CONSTANT`)

✅ **File Names:** 
- Use `lowercase_underbar_intuitive_names`.
- For each screen page, file name ends with `xx_xx_screen.dart`.
- Make sure to create two distinct files for parent/teacher widgets.


## Formatting / Structures
**Indentation:** Indent each level with 2 spaces.

**Whitespace:** Use whitespace to improve clarity and readability, and to separate logics.


## Documentations / Comments
**Code Documentation:** Document all public modules, functions, packages, and any other necessary sources.

**Usage of Comments:**
- Separate Stateful Widgets and Stateless Widgets as followed:
    >e.g. `======== This Comments ========`
- Classes - Leave a comment above the class to clarify which class it is.
- Use comments for explaining complicatd logics.
- Use comments for clarifying ambiguous expressions, names, etc.
- Do not use comments for obvious features.
- Comment out any unused part of code which still has to be archived.