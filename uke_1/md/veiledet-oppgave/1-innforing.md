## Innføring i introduksjon til `React`

### Oppgave 1: Installasjon

1. **Sjekk om Node.js er installert**  
   Mange brukere vil allerede ha Node.js og npm (Node Package Manager) installert på sin maskin. For å sjekke om de er installert, åpne terminalen eller kommandolinjen og kjør følgende kommandoer:
   ```bash
   node -v
   npm -v
   ```
   Hvis Node.js og npm er installert, skal du se versjonsnumrene for begge verktøyene, for eksempel:
   ```bash
   v16.13.0
   8.1.0
   ```

> [!NOTE]  
> Hvis de ikke er installert vil du få `command not found`. 

2. **Installer Node.js hvis det ikke er installert**  
    Hvis du ikke ser versjonsnumrene, må du installere Node.js. Gå til [Node.js sin offisielle nettside](https://nodejs.org/en) og last ned den nyeste versjonen.

### Oppgave 2: Opprett et nytt React-prosjekt

1. **Opprett prosjektet**  
    For å opprette et nytt React-prosjekt med Vite, kjør følgende kommando i terminalen:
    ```bash
    npm create vite@latest online-cv
    ```

    Du vil da se et skjermbilde som dette:

    ![Vite Create Project](./static/vite-create-app.png)

   > [!IMPORTANT]  
   > Velg `React`, og deretter `Javascript`.

    Dette vil opprette en ny mappe kalt `online-cv` med alle nødvendige filer og avhengigheter for et React-prosjekt som bruker Javascript.

2. **Naviger til prosjektmappen**  
    Gå inn i prosjektmappen ved å kjøre:
    ```bash
    cd online-cv
    ```

3. **Installer avhengigheter**  
    Installer nødvendige avhengigheter ved å kjøre:
    ```bash
    npm install
    ```

4. **Start prosjektet**  
    Start utviklingsserveren ved å kjøre:
    
    ```bash
    npm run dev
    ```

    Du bør nå få opp følgende skjermbilde

    ![Vite Run Status](./static/vite-run-status.png)
    
    hvor man i dette tilfellet ser at serveren kjører på port `5173`. 

### Oppgave 3: Grunnleggende Struktur

Når du bruker `npm create vite`-kommandoen for å opprette et nytt prosjekt, vil du se følgende filer og mapper:

- `App.css`: Denne filen inneholder stilarkene for `App`-komponenten. Du kan bruke denne filen til å legge til CSS-stiler som gjelder for hele applikasjonen.
- `App.jsx`: Dette er hovedkomponenten i React-applikasjonen din. Her vil du definere strukturen og logikken for applikasjonen.
- `assets`: Denne mappen inneholder statiske ressurser som bilder og andre medier som brukes i applikasjonen.
- `index.css`: Denne filen inneholder globale CSS-stiler som gjelder for hele applikasjonen. Du kan bruke denne filen til å definere grunnleggende stiler som gjelder for alle komponenter.
- `main.jsx`: Dette er inngangspunktet for React-applikasjonen din. Her importeres hovedkomponenten (`App`) og renderes til DOM-en.

1. **Fjern standardkode**  
    Åpne `App.jsx` i en teksteditor og fjern all kode.

2. **Legg til en overskrift**  
    Legg til følgende kode i `App.jsx` for å vise en overskrift:
    ```jsx
    function App() {
      return (
         <div>
            <h1>Mitt Online CV</h1>
         </div>
      );
    }
    export default App;
    ```
3. **Legg til et bilde**  
   Under overskriften, legg til et bilde av deg selv - i dette eksempelet brukes `reactLogo` som bilde. 

   ```diff
   +import reactLogo from "./assets/react.svg"
   +
   function App() {
      return (
         <div>
         <h1>Mitt Online CV</h1>
   +        <img src={reactLogo} className="logo react" alt="React logo" />
         </div>
      );
   }
   ```

   <details>
   <summary>Se full kode</summary>

   ```jsx
   import reactLogo from "./assets/react.svg";

   function App() {
      return (
         <div>
            <h1>Mitt Online CV</h1>
            <img src={reactLogo} className="logo react" alt="React logo" />
         </div>
      );
   }
   export default App;
   ```

   </details>

   I denne koden importerer vi et bilde (`reactLogo`) fra `./assets`-mappen og bruker det i en `<img>`-tag. `src`-attributtet til `<img>`-taggen peker på bildet vi importerte, og `alt`-attributtet gir en beskrivelse av bildet som vises hvis bildet ikke kan lastes. `className`-attributtet brukes til å legge til CSS-klasser for styling av bildet.

4. **Legg til grunnleggende informasjon**  
   Legg til informasjon som navn, adresse, telefonnummer og e-post:

   ```diff
     function App() {
       <div>
         <h1>Mitt Online CV</h1>
         <img src={reactLogo} className="logo react" alt="React logo" />
   +        <p>Navn: [Ditt Navn]</p>
   +        <p>Adresse: [Din Adresse]</p>
   +        <p>Telefonnummer: [Ditt Telefonnummer]</p>
   +        <p>E-post: [Din E-post]</p>
       </div>
     );
   }
   ```

   <details>
   <summary>Se full kode</summary>

   ```jsx
   function App() {
   return (
      <div>
         <h1>Mitt Online CV</h1>
         <img src="link-til-bilde" alt="Mitt bilde" />
         <p>Navn: [Ditt Navn]</p>
         <p>Adresse: [Din Adresse]</p>
         <p>Telefonnummer: [Ditt Telefonnummer]</p>
         <p>E-post: [Din E-post]</p>
      </div>
   );
   }
   ```
   </details>

### Oppgave 4: Interaktivitet

1. **Legg til en knapp**  
    Legg til en knapp under din informasjon med teksten 'Vis detaljer':
    ```jsx
    function App() {
      const visDetaljer = () => {
         alert('Ferdigheter: HTML, CSS, JavaScript, React');
      };

      return (
         <div>
            <h1>Mitt Online CV</h1>
            <img src="link-til-bilde" alt="Mitt bilde" />
            <p>Navn: [Ditt Navn]</p>
            <p>Adresse: [Din Adresse]</p>
            <p>Telefonnummer: [Ditt Telefonnummer]</p>
            <p>E-post: [Din E-post]</p>
            <button onClick={visDetaljer}>Vis detaljer</button>
         </div>
      );
    }
    ```

### Utfordringsoppgave 1: Komponenter

1. **Splitt applikasjonen i komponenter**  
    Opprett tre separate komponenter: `Header`, `PersonalInfo` og `SkillsButton`.

2. **Header-komponenten**  
    Opprett en ny fil `Header.jsx`:
    ```jsx
    function Header() {
      return (
         <div>
            <h1>Mitt Online CV</h1>
            <img src="link-til-bilde" alt="Mitt bilde" />
         </div>
      );
    }
    export default Header;
    ```

3. **PersonalInfo-komponenten**  
    Opprett en ny fil `PersonalInfo.jsx`:
    ```jsx
    function PersonalInfo() {
      return (
         <div>
            <p>Navn: [Ditt Navn]</p>
            <p>Adresse: [Din Adresse]</p>
            <p>Telefonnummer: [Ditt Telefonnummer]</p>
            <p>E-post: [Din E-post]</p>
         </div>
      );
    }
    export default PersonalInfo;
    ```

4. **SkillsButton-komponenten**  
    Opprett en ny fil `SkillsButton.jsx`:
    ```jsx
    function SkillsButton() {
      const visDetaljer = () => {
         alert('Ferdigheter: HTML, CSS, JavaScript, React');
      };

      return (
         <button onClick={visDetaljer}>Vis detaljer</button>
      );
    }
    export default SkillsButton;
    ```

5. **Bruk komponentene i `App.jsx`**  
    Oppdater `App.jsx` til å bruke de nye komponentene:
    ```jsx
    import Header from './Header';
    import PersonalInfo from './PersonalInfo';
    import SkillsButton from './SkillsButton';

    function App() {
      return (
         <div>
            <Header />
            <PersonalInfo />
            <SkillsButton />
         </div>
      );
    }
    export default App;
    ```

### Utfordringsoppgave 2: Props

1. **Overfør data med props**  
    Oppdater `PersonalInfo` til å motta data som props:
    ```jsx
    function PersonalInfo({ navn, adresse, telefonnummer, epost }) {
      return (
         <div>
            <p>Navn: {navn}</p>
            <p>Adresse: {adresse}</p>
            <p>Telefonnummer: {telefonnummer}</p>
            <p>E-post: {epost}</p>
         </div>
      );
    }
    export default PersonalInfo;
    ```

2. **Send props fra `App.jsx`**  
    Oppdater `App.jsx` til å sende props til `PersonalInfo`:
    ```jsx
    import Header from './Header';
    import PersonalInfo from './PersonalInfo';
    import SkillsButton from './SkillsButton';

    function App() {
      return (
         <div>
            <Header />
            <PersonalInfo 
              navn="[Ditt Navn]" 
              adresse="[Din Adresse]" 
              telefonnummer="[Ditt Telefonnummer]" 
              epost="[Din E-post]" 
            />
            <SkillsButton />
         </div>
      );
    }
    export default App;
    ```

