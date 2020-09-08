// ==UserScript==
// @name            iOSGods App Store | Direct .IPA File Download
// @namespace       de.sidneys.userscripts
// @homepage        https://gist.githubusercontent.com/sidneys/
// @version         0.9.9
// @description     Download .IPA files directly from the iOSGods App Store (app.iosgods.com) without a "ViP" subscription.
// @author          JINXO
// @icon            https://app.iosgods.com/apple-touch-icon.png
// @include         http*://app.iosgods.com/store/*
// @require         https://cdn.jsdelivr.net/npm/plist@3.0.1/dist/plist.min.js
// @require         https://greasyfork.org/scripts/38888-greasemonkey-color-log/code/Greasemonkey%20%7C%20Color%20Log.js
// @require         https://greasyfork.org/scripts/374849-library-onelementready-es6/code/Library%20%7C%20onElementReady%20ES6.js
// @connect         iosgods.com
// @grant           GM.addStyle
// @grant           GM.download
// @run-at          document-end
// ==/UserScript==

/**
 * ESLint
 * @global
 */
/* global plist */
/* global onElementReady */
let Debug = true

/**
 * Init
 */
let init = () => {
    console.debug('init')

    // Wait for element (Button "Install")
    onElementReady('.app--detail__downloads > .btn-download', false, (installElement) => {
        // Get url of iTunes OTA Manifest (XML Property List)
        const installUrl = new URL(installElement.dataset.href)
        const manifestHref = installUrl.searchParams.get('url')

        // Status
        console.info('iTunes OTA Manifest URL:', manifestHref)

        // Download iTunes OTA Manifest
        fetch(manifestHref)
            .then((response) => {
                if (!response.ok) {
                    console.error('Error', 'fetch', response.status)
                    throw new Error(response.status)
                }
                return response.text()
            })
            .then((responseText) => {
                // Parse iTunes Manifest for .IPA URL
                const manifestObject = plist.parse(responseText)
                const packageObject = manifestObject.items[0].assets.find(asset => asset.kind === 'software-package')
                const ipaHref = packageObject.url

                // Status
                console.info('.IPA file URL:', ipaHref)

                // Wait for element (Button "Download .IPA File for Impactor")
                onElementReady('div.actions-button:nth-child(2)', false, (downloadElement) => {
                    console.info(downloadElement)
                    // Remove all click events from button
                    const downloadElementClone = downloadElement.cloneNode(true)
                    downloadElement.parentNode.replaceChild(downloadElementClone, downloadElement)

                    // Add button link
                    downloadElementClone.onclick = () => window.open(ipaHref, '_new')

                    // Add checkmark to button label and change its  color
                    downloadElementClone.textContent = `✓ ${downloadElementClone.textContent}`
                    downloadElementClone.style.color = 'rgb(76, 217, 100)'

                    // Status
                    console.info('Download button successfully updated.')
                })
            })
    })
}

/**
 * @listens window:Event#load
 */
window.addEventListener('load', () => {
    console.debug('window#load')

    init()
})