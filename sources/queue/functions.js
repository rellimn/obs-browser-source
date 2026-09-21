async function update(url, classTrue, classFalse) {
    const imageEl = document.getElementById("status")
    const setError = (error) => {
        imageEl.className = ""
        imageEl.innerHTML = `<h1 class="error">${error}</h1>`
    }
    try {
        const requestUrl = new URL(url)
        requestUrl.searchParams.set("_t", String(Date.now()))


        const response = await fetch(requestUrl, {
            cache: "no-store"
        })

        if (!response.ok) {
            setError(`HTTP ${response.status}`)
            return
        }
        const isOpen =
            (await response.text()).trim().toLowerCase() === "true"

        imageEl.className =
            isOpen ? classTrue : classFalse
        imageEl.innerHTML = ""

    } catch (e) {
        setError("Network error")
        console.error(e)
    }
}