Adblock Plus (ABP) filter syntax defines the rules used to block or hide
elements on web pages. Here's a breakdown of the common syntax elements:

**1. Basic Blocking Filters:**

  * **Blocking by URL:** The simplest filter is the exact URL of the item you want to block.

    ```
    http://example.com/annoying-ad.gif
    ```

  * **Wildcards (`*`):** An asterisk matches any sequence of characters.

    ```
    http://example.com/banner*
    ```

    This would block `http://example.com/banner.gif`,
    `http://example.com/banner1.jpg`, `http://example.com/banner/ad.html`,
    etc.

  * **Anchors (`^`):** A caret represents a separator character (anything but
    a letter, digit, or `_`, `-`, `.`, `%`) or the end of the address. This is
    useful for blocking domains or specific parts of a URL.

    ```
    ||example.com^
    ```

    This blocks requests to `example.com` and its subdomains, followed by a
    separator (like `/`, `:`, `?`, or the end of the URL). It would block
    `http://example.com/`, `http://sub.example.com/`, but not
    `http://example.compliance.com`.

    ```
    /banner/*/img^
    ```

    This blocks `http://example.com/banner/foo/img`,
    `http://example.com/banner/bar/baz/img?param`, but not
    `http://example.com/banner/img` or `http://example.com/banner/foo/image`.

  * **Verbatim Text:** You can block based on specific text within a URL.

    ```
    /popup/
    ```

    This blocks any URL containing `/popup/`.

  * **End Anchor (`$`):** The dollar sign indicates the end of the address.

    ```
    http://example.com/$
    ```

    This would only block `http://example.com/` and not
    `http://example.com/something`.

**2. Exception Rules:**

  * Exception rules start with `@@` and prevent blocking of specific items or
    pages.

    ```
    @@http://example.com/allowed-ad.gif
    @@||example.com^$document
    ```

    The first example allows a specific ad. The second example, with the
    `$document` option, disables Adblock Plus on all pages from `example.com`.

**3. Filter Options:**

Filter options modify how a filter rule is applied. They are added at the end
of the filter, after a `$`, and separated by commas.

  * **`type`:** Restricts the filter to specific request types (`script`,
    `image`, `stylesheet`, `object`, `subdocument`, `xmlhttprequest`,
    `websocket`, `webrtc`, `popup`). Use `~` to exclude a type.

    ```
    /ads/*$image
    ~script,image
    ```

    The first blocks only images in `/ads/`. The second blocks everything
    except scripts and images.

  * **`domain`:** Applies the filter only to specific domains or subdomains.
    Use `~` to exclude a domain. Multiple domains are separated by `|`.

    ```
    ||example.com/banner.gif$domain=example.com|example.net
    ||adserver.com^$domain=~sub.example.com
    ```

    The first rule blocks the banner only on `example.com` and `example.net`.
    The second blocks `adserver.com` on all subdomains of `example.com`.

  * **`third-party` / `~third-party`:** Applies the filter only to requests
    originating from a third-party or a first-party domain.

    ```
    /tracker.js$third-party
    ```

  * **`match-case`:** Makes the filter case-sensitive.

    ```
    /BannerAd.gif$image,match-case
    ```

  * **`sitekey`:** Applies the filter only to pages providing a specific site
    key.

  * **`rewrite`:** (Advanced) Allows modification of requests. Restricted to
    certain domains and cannot be used with `$third-party`. Examples include
    redirecting to blank resources.

    ```
    *$rewrite=abp-resource:blank-js,domain=example.com
    ```

  * **`generichide` / `genericblock`:** Prevents applying global element
    hiding/blocking rules on a specific page.

    ```
    @@||example.com^$generichide
    ```

  * **`document`:** (As seen in exceptions) Applies the rule to the entire
    document.

  * **`elemhide`:** Prevents element hiding rules from applying on a page.

**4. Element Hiding Rules:**

These rules hide specific HTML elements on a page using CSS selectors. They
start with `##`.

  * **By ID:**

    ```
    ##advertisement
    ```

    Hides the element with the ID `advertisement`.

  * **By Class:**

    ```
    ##.banner
    ```

    Hides all elements with the class `banner`.

  * **By Attribute:**

    ```
    ##[href*="ad"]
    ```

    Hides all elements with an `href` attribute containing "ad".

  * **Combinations:** You can use more complex CSS selectors.

    ```
    ##div#sidebar > .announcement
    ```

    Hides elements with the class `announcement` that are direct children of a
    `div` with the ID `sidebar`.

**5. Element Hiding Exception Rules:**

These rules prevent element hiding rules from being applied to specific
elements. They start with `#@#`.

```
#@#div#main-content > .important-banner
```

This prevents any element hiding rules from affecting the `.important-banner`
element within the `div#main-content`.

**6. Extended CSS Selectors (Element Hiding Emulation):**

These start with `#?#` and offer more advanced matching based on element
properties.

```
example.com#?#div:-abp-properties(width:300px;height:250px;)
example.com#?#div:-abp-has(> div > img.advert)
```

**7. Snippet Filters:**

These start with `#$#` and allow running JavaScript code snippets on specified
domains.

```
example.com#$#log Hello
```

**8. Comments:**

Lines starting with `!` are treated as comments and are ignored.

```
! This is a comment
```

**9. Filter List Metadata (Special Comments):**

Filter lists can include special comments at the beginning (after the
`[Adblock Plus]` header) that provide metadata about the list. These also
start with `!`.

```
! Title: My Custom Filters
! Version: 1.0
! Expires: 7 days
! Homepage: https://myfilters.example.com
```

For comprehensive and up-to-date information, refer to the official Adblock
Plus documentation and filter cheatsheet.
