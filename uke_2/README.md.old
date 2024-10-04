# Veiledet Oppgave: Introduksjon til React
## Mål
Ved slutten av denne oppgaven skal du ha fått en **god forståelse** for grunnleggende konsepter i React og hvordan man bygger en React-applikasjon.

## Forutsetninger
- *Grunnleggende kunnskaper om JavaScript*
- *Enkel erfaring med HTML og CSS*

## Del 1: Oppsett av prosjektet

### Steg 1: Installere React

1. Åpne terminalen og naviger til prosjektmappen din.
2. Kjør følgende kommandoer for å installere React og andre nødvendige avhengigheter:

```bash
npx create-react-app my-react-app
cd my-react-app
```

> [!TIP]
> Sørg for at du har Node.js installert på systemet ditt før du kjører disse kommandoene.

3. Start utviklingsserveren:

```bash
npm start
```

## Del 2: Grunnleggende React-konsepter

### Steg 2: Struktur og JSX

1. Åpne filen `src/App.js` og beskriv strukturen til en React-applikasjon:

```javascript
import React from 'react';

function App() {
    return (
        <div className="App">
            <header className="App-header">
                <h1>Velkommen til min React-app</h1>
            </header>
        </div>
    );
}

export default App;
```

> [!NOTE]
> JSX er en syntaksutvidelse for JavaScript som lar deg skrive HTML-lignende kode i React-komponenter.

## Del 3: Komponenter i React

### Steg 3: Funksjonelle komponenter

1. Lag en funksjonell komponent som viser en teller:

```javascript
import React, { useState } from 'react';

function Counter() {
    const [count, setCount] = useState(0);

    return (
        <div>
            <p>Teller: {count}</p>
            <button onClick={() => setCount(count + 1)}>
                Øk
            </button>
        </div>
    );
}

export default Counter;
```

> [!IMPORTANT]
> `useState` er en hook som lar deg legge til state i funksjonelle komponenter.

## Del 4: Props og State

### Steg 4: Props

1. Lag en forelder-komponent som sender props til en barn-komponent:

```javascript
function ParentComponent() {
    return (
        <ChildComponent name="John" age={30} />
    );
}

function ChildComponent(props) {
    return (
        <div>
            <p>Navn: {props.name}</p>
            <p>Alder: {props.age}</p>
        </div>
    );
}

export default ParentComponent;
```

> [!NOTE]
> Props er en måte å sende data fra en forelder-komponent til en barn-komponent.

### Steg 5: State

1. Oppdater state i en funksjonell komponent:

```javascript
import React, { useState } from 'react';

function Counter() {
    const [count, setCount] = useState(0);

    return (
        <div>
            <p>Teller: {count}</p>
            <button onClick={() => setCount(count + 1)}>
                Øk
            </button>
        </div>
    );
}

export default Counter;
```

> [!TIP]
> Bruk `setCount` for å oppdatere state-verdien.

## Del 5: Event Handling

### Steg 6: Callback Functions

1. Lag en komponent med en callback-funksjon:

```javascript
function ButtonComponent({ onClick }) {
    return <button onClick={onClick}>Klikk meg</button>;
}

function ParentComponent() {
    const handleClick = () => {
        console.log("Knapp klikket!");
    };

    return (
        <div>
            <ButtonComponent onClick={handleClick} />
        </div>
    );
}

export default ParentComponent;
```

> [!WARNING]
> Sørg for at callback-funksjonen er definert i forelder-komponenten for å unngå uventede resultater.

## Del 6: Lifecycle Methods

### Steg 7: Mounting and Unmounting

1. Bruk `componentDidMount` for å utføre en handling når komponenten mountes:

```javascript
import React from 'react';

class MyComponent extends React.Component {
    componentDidMount() {
        console.log("Komponenten er mountet");
    }

    render() {
        return <div>Hei Verden</div>;
    }
}

export default MyComponent;
```

> [!NOTE]
> `componentDidMount` er en livssyklusmetode som kjører etter at komponenten er lagt til i DOM.

## Del 7: Styling i React

### Steg 8: Inline Styles vs CSS Modules

1. Bruk inline styles:

```javascript
function StyledComponent() {
    return <div style={{ color: "blue", fontSize: "20px" }}>Stilet tekst</div>;
}

export default StyledComponent;
```

> [!CAUTION]
> Inline styles kan bli vanskelig å vedlikeholde i store applikasjoner.

2. Bruk CSS Modules:

```javascript
import styles from "./MyStyles.module.css";

function StyledComponent() {
    return <div className={styles.styledText}>Stilet tekst</div>;
}

export default StyledComponent;
```

> [!TIP]
> CSS Modules gir deg muligheten til å bruke scoped CSS, som forhindrer [stilkonflikter](#stilkonflikter).

## Appendix

## Stilkonflikter

> [!NOTE]
> Stilkonflikter oppstår når flere CSS-regler konkurrerer om å style det samme elementet, noe som kan føre til uventede resultater. For eksempel som vist med to forskjellige `css`-filer:

```css
/* style1.css */
.text {
    color: red;
}

/* style2.css */
.text {
    color: blue;
}
```

```html
<!-- index.html -->
<link rel="stylesheet" href="style1.css">
<link rel="stylesheet" href="style2.css">
<div class="text">Dette er en test</div>
```

> I dette tilfellet vil det siste definerte stilarket (`style2.css`) overstyre det første, og teksten vil bli blå.