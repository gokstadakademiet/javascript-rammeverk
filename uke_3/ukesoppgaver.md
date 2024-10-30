# Oppgavesett: Interaktiv Online CV Webapplikasjon: Debugging & Testing

## Innføring i `Jest` og `Debugging` teknikker

### **Oppgave 1: Basic Logging**

**Mål:** Introduser logging for å spore hendelser i applikasjonen.

**Beskrivelse:**  
Introduser `console.log()`-utsagn i CV-applikasjonen din for å spore verdien av variabler på viktige tidspunkter, for eksempel når brukeren legger til eller sletter en erfaring eller ferdighet.  
**Eksempel:** Når en bruker prøver å legge til en ny ferdighet i CV-en sin, logger du tidspunktet og selve ferdigheten for å bekrefte at den blir lagt til som forventet.  
[Se et eksempel her](https://developer.mozilla.org/en-US/docs/Web/API/Console/log)

**Løsning:** 
For å introdusere logging, kan du bruke `console.log()` på strategiske steder i koden:

<details><summary>Se full kode</summary>

```javascript
const addSkill = (skill) => {
  console.log('Adding skill at:', new Date());
  console.log('Skill:', skill);
  // Resten av koden som legger til ferdigheten
}
```
</details>

**Forklaring:** 
Ved å logge tidspunktet og ferdigheten, kan vi bekrefte at ferdigheten blir lagt til som forventet.

> [!TIP]
> Bruk `console.log()` strategisk for å spore variabler og hendelser i applikasjonen din. Dette kan hjelpe deg med å forstå flyten og finne feil raskere.

### **Oppgave 2: Jest Grunnleggende - Testing av Funksjoner**

**Mål:** Test funksjoner som hjelper med å formatere data for CV-appen.

**Beskrivelse:**  
Tenk deg at du har en funksjon som formaterer telefonnummeret for CV-en. Den skal sørge for at alle telefonnumre har en bestemt format, for eksempel +47-12345678.  
Skriv en Jest-test for å bekrefte at funksjonen riktig formaterer ulike varianter av telefonnumre til ønsket format.  
[Link: Telefonnummer formatering med Jest](https://jestjs.io/docs/getting-started)

**Steg 1: Opprett funksjonen som skal testes**

<details><summary>Se full kode</summary>

```javascript
// formatPhone.js
const formatPhone = (phone) => {
  // Formatering logikk
}
```
</details>

**Forklaring:** 
Denne funksjonen skal ta et telefonnummer som input og returnere det i ønsket format.

> [!NOTE]
> Sørg for at funksjonen håndterer ulike formater av telefonnumre og returnerer dem i et konsistent format.

**Steg 2: Skriv en Jest-test for funksjonen**

<details><summary>Se full kode</summary>

```javascript
// formatPhone.test.js
test('formats phone numbers correctly', () => {
  expect(formatPhone('12345678')).toBe('+47-12345678');
  // ... flere tester
});
```
</details>

**Forklaring:** 
Med Jest, kan vi enkelt skrive tester for funksjoner som `formatPhone` for å sikre at de virker som forventet.

> [!IMPORTANT]
> Testing av funksjoner er avgjørende for å sikre at applikasjonen din fungerer som forventet og for å unngå feil i produksjon.

### **Oppgave 3: Testing av Data Manipulering**

**Mål:** Test funksjoner som legger til eller fjerner ferdigheter fra CV-en.

**Beskrivelse:**  
I CV-appen kan brukere legge til ferdigheter. Tenk deg at du har en funksjon som tar en ferdighet og legger den til en liste.  
Skriv en Jest-test for å sjekke at når en ferdighet legges til, er den faktisk lagt til i listen. Du bør også teste hva som skjer hvis brukeren prøver å legge til en tom ferdighet eller en ferdighet som allerede er på listen.  
[Link: Teste arrays og iterables med Jest](https://jestjs.io/docs/tutorial-async)

**Steg 1: Opprett funksjonen som skal testes**

<details><summary>Se full kode</summary>

```javascript
// skills.js
const addSkill = (skills, skill) => {
  if (skill && !skills.includes(skill)) {
    skills.push(skill);
  }
  return skills;
}
```
</details>

**Forklaring:** 
Denne funksjonen tar en liste av ferdigheter og en ny ferdighet som input, og legger til den nye ferdigheten i listen hvis den ikke allerede finnes der.

> [!CAUTION]
> Sørg for at funksjonen håndterer tilfeller der ferdigheten allerede finnes i listen eller er tom.

**Steg 2: Skriv en Jest-test for funksjonen**

<details><summary>Se full kode</summary>

```javascript
// skills.test.js
test('adds a skill to the list', () => {
  const skills = ['JavaScript'];
  const updatedSkills = addSkill(skills, 'React');
  expect(updatedSkills).toContain('React');
});
```
</details>

**Forklaring:** 
Med Jest, kan vi skrive tester for funksjoner som legger til eller fjerner ferdigheter fra en liste for å sikre korrekt funksjonalitet.

> [!TIP]
> Test både positive og negative tilfeller for å sikre at funksjonen din håndterer alle mulige scenarier.

### **Oppgave 4: Testing av UI-komponenter med Jest**

**Mål:** Bli kjent med hvordan du kan bruke Jest for å teste interaktive aspekter av CV-appen.

**Beskrivelse:**  
Tenk deg at du har en knapp i CV-appen som, når den blir klikket, åpner et vindu eller en modal der brukere kan redigere sin erfaring.  
Skriv en Jest-test som simulerer et klikk på denne knappen og bekrefter at redigeringsvinduet faktisk åpnes.  
[Link: Simuler events med Jest og @testing-library/react](https://testing-library.com/docs/dom-testing-library/api-events/)

**Steg 1: Opprett komponenten som skal testes**

<details><summary>Se full kode</summary>

```javascript
// EditButton.js
import React, { useState } from 'react';

const EditButton = () => {
  const [isOpen, setIsOpen] = useState(false);

  const handleClick = () => {
    setIsOpen(true);
  };

  return (
    <div>
      <button onClick={handleClick}>Edit</button>
      {isOpen && <div>Edit Window</div>}
    </div>
  );
};

export default EditButton;
```
</details>

**Forklaring:** 
Denne komponenten viser en knapp som, når den blir klikket, åpner et redigeringsvindu.

> [!NOTE]
> Bruk `useState` for å håndtere tilstanden til redigeringsvinduet.

**Steg 2: Skriv en Jest-test for komponenten**

<details><summary>Se full kode</summary>

```javascript
// EditButton.test.js
import { render, fireEvent } from '@testing-library/react';
import EditButton from './EditButton';

test('opens edit window on click', () => {
  const { getByText } = render(<EditButton />);
  fireEvent.click(getByText('Edit'));
  expect(getByText('Edit Window')).toBeInTheDocument();
});
```
</details>

**Forklaring:** 
Med kombinasjonen av Jest og `@testing-library/react`, kan vi simulere brukerinteraksjoner og teste UI-komponenter.

> [!IMPORTANT]
> Testing av UI-komponenter sikrer at brukergrensesnittet ditt fungerer som forventet og gir en god brukeropplevelse.

### **Oppgave 5: Feilsøking av Kode**

**Mål:** Lær å identifisere og rette feil i koden.

**Beskrivelse:**  
I denne oppgaven skal du finne og rette en feil i en gitt kode. Koden nedenfor er ment å legge til en ferdighet i en liste, men det er en feil som hindrer den fra å fungere som forventet. Finn feilen og rett den.

**Kode som skal feilsøkes:**

<details><summary>Se full kode</summary>

```javascript
// skills.js
const addSkill = (skills, skill) => {
  if (skill || !skills.includes(skill)) {
    skills.push(skill);
  }
  return skills;
}
```
</details>

**Forklaring:** 
Denne funksjonen skal legge til en ferdighet i en liste hvis ferdigheten ikke allerede finnes i listen og ferdigheten ikke er tom.

**Løsning:** 
Feilen ligger i betingelsen `if (skill || !skills.includes(skill))`. Den skal bruke en logisk OG (`&&`) i stedet for en logisk ELLER (`||`).

**Rettet kode:**

<details><summary>Se full kode</summary>

```javascript
// skills.js
const addSkill = (skills, skill) => {
  if (skill && !skills.includes(skill)) {
    skills.push(skill);
  }
  return skills;
}
```
</details>

**Forklaring:** 
Ved å bruke `&&` i stedet for `||`, sikrer vi at ferdigheten kun legges til hvis den ikke er tom og ikke allerede finnes i listen.



### **Oppgave 5: Snapshot Testing**

**Mål:** Forstå grunnprinsippene for snapshot testing og hvordan det kan brukes for å sikre at UI ikke endres utilsiktet.

**Beskrivelse:**  
I CV-appen, tenk deg at du har en komponent som viser brukerens utdanningshistorikk. Vi skal skrive en Jest snapshot-test for denne komponenten for å sikre at den ikke endres utilsiktet i fremtidige oppdateringer av koden.  
[Link: Snapshot Testing med Jest](https://jestjs.io/docs/snapshot-testing)

#### **Steg 1: Installere nødvendige avhengigheter**

Før vi kan skrive snapshot-tester, må vi sørge for at vi har installert Jest og React Test Renderer. Kjør følgende kommandoer i terminalen din:

```bash
npm install --save-dev jest react-test-renderer
```

> [!IMPORTANT]  
> Sørg for at du kjører kommandoene i rotmappen til prosjektet ditt for å unngå installasjonsproblemer.

#### **Steg 2: Opprette Snapshot Test**

Nå som vi har installert nødvendige avhengigheter, kan vi opprette en snapshot-test for `EducationHistory`-komponenten. Lag en ny fil, for eksempel `EducationHistory.test.js`, og legg til følgende kode:

<details><summary>Se full kode</summary>

```javascript
import renderer from 'react-test-renderer';
import EducationHistory from './EducationHistory';

test('EducationHistory component renders correctly', () => {
  const tree = renderer.create(<EducationHistory />).toJSON();
  expect(tree).toMatchSnapshot();
});
```

</details>

#### **Forklaring av koden:**

1. **Importere nødvendige moduler:**
   ```javascript
   import renderer from 'react-test-renderer';
   import EducationHistory from './EducationHistory';
   ```
   Vi importerer `react-test-renderer` for å kunne lage en snapshot av komponenten, og `EducationHistory`-komponenten som vi skal teste.

2. **Opprette snapshot-testen:**
   ```javascript
   test('EducationHistory component renders correctly', () => {
     const tree = renderer.create(<EducationHistory />).toJSON();
     expect(tree).toMatchSnapshot();
   });
   ```
   - `renderer.create(<EducationHistory />).toJSON();` lager en JSON-representasjon av `EducationHistory`-komponenten.
   - `expect(tree).toMatchSnapshot();` sammenligner den genererte JSON-representasjonen med en tidligere lagret snapshot. Hvis det ikke finnes en tidligere snapshot, vil Jest opprette en ny.

> [!NOTE]  
> Sørg for at komponenten `EducationHistory` er korrekt importert og at filbanen er riktig, ellers vil testen feile.

#### **Steg 3: Kjøring av testen**

For å kjøre testen, legg til følgende script i `package.json`-filen din:

```json
"scripts": {
  "test": "jest"
}
```

Kjør deretter testen ved å kjøre følgende kommando i terminalen:

```bash
npm test
```

> [!TIP]
> Du kan også bruke `npm test -- --watch` for å kjøre testene kontinuerlig mens du utvikler.

#### **Hva skjer når testen kjører?**

Når du kjører testen for første gang, vil Jest opprette en snapshot-fil som inneholder JSON-representasjonen av `EducationHistory`-komponenten. Denne filen lagres i en mappe kalt `__snapshots__`.

> [!CAUTION]  
> Endringer i komponentens struktur eller utseende vil føre til at snapshot-testen feiler. Dette er en indikasjon på at du bør gjennomgå endringene nøye.

#### **Hvorfor er snapshot testing nyttig?**

Snapshot testing er nyttig fordi det lar oss fange utilsiktede endringer i UI-komponenter. Hvis noen endrer `EducationHistory`-komponenten i fremtiden, vil snapshot-testen feile hvis den nye outputen ikke matcher den lagrede snapshoten. Dette gir oss en mulighet til å gjennomgå endringene og bekrefte at de er forventet.

#### **Oppsummering**

Med snapshot testing kan vi sikre at komponentens output ikke endres utilsiktet over tid. Dette er spesielt nyttig i store prosjekter hvor mange utviklere jobber på samme kodebase, da det hjelper med å opprettholde konsistens i UI-komponentene.

### **Feilsøkingsoppgave: Finn Feilen i Snapshot Testen**

**Mål:** Lære å identifisere og rette feil i snapshot tester.

**Beskrivelse:**  
I denne oppgaven skal du finne og rette en feil i en snapshot-test for `EducationHistory`-komponenten. Koden nedenfor inneholder en feil som gjør at snapshot-testen feiler. Din oppgave er å finne og rette feilen slik at testen kjører korrekt.

<details><summary>Se full kode</summary>

```javascript
import renderer from 'react-test-renderer';
import EducationHistory from './EducationHistory';

test('EducationHistory component renders correctly', () => {
  const tree = renderer.create(<EducationHistory />).toJSON();
  expect(tree).toMatchSnapshot();
});
```

</details>

#### **Løsningsforslag:**

Feilen i koden ligger i importeringen av `EducationHistory`-komponenten. Sørg for at filbanen til `EducationHistory` er korrekt. Hvis komponenten ligger i en annen mappe, må du oppdatere importbanen.

For eksempel, hvis `EducationHistory`-komponenten ligger i en undermappe kalt `components`, bør importen se slik ut:

<details><summary>Se full kode</summary>

```javascript
import renderer from 'react-test-renderer';
import EducationHistory from './components/EducationHistory';

test('EducationHistory component renders correctly', () => {
  const tree = renderer.create(<EducationHistory />).toJSON();
  expect(tree).toMatchSnapshot();
});
```

</details>

Ved å rette filbanen til `EducationHistory`-komponenten, vil snapshot-testen kjøre korrekt og sammenligne komponentens output med den lagrede snapshoten.



## Innføring i `PropTypes` & `TypeScript`

### **Oppgave 1: Intro til PropTypes**

**Mål:** Bli kjent med PropTypes for typechecking før vi dykker dypere inn i TypeScript.

**Beskrivelse:**  
Opprett en React-komponent `Profile` som viser grunnleggende brukerinformasjon. Bruk PropTypes for å sikre at `Profile` tar inn følgende props:
- `name`: en streng
- `age`: et nummer
- `experience`: en array av objekter, hvor hvert objekt har en `title` (streng) og `years` (nummer).

**Link:** [PropTypes documentation](https://reactjs.org/docs/typechecking-with-proptypes.html)

**Trinnvis Løsning:**

1. **Opprett en ny React-komponent kalt `Profile`:**  
   Begynn med å opprette en ny fil kalt `Profile.js` i prosjektets komponentmappe. Dette er hvor vi skal skrive vår React-komponent.

2. **Skriv komponenten:**  
   Innenfor `Profile.js`, importer React og PropTypes. Dette er nødvendig for å kunne bruke React og PropTypes i vår komponent.

   <details><summary>Se full kode</summary>
   
   ```javascript
   import React from 'react';
   import PropTypes from 'prop-types';
   ```

   Deretter, opprett `Profile`-komponenten. En komponent i React er en funksjon som returnerer JSX, som er en syntaksutvidelse for JavaScript som ligner på HTML.

   <details><summary>Se full kode</summary>
   
   ```javascript
   const Profile = ({ name, age, experience }) => {
     return (
       <div>
         <h2>{name}</h2>
         <p>Age: {age}</p>
         <ul>
           {experience.map((exp, index) => (
             <li key={index}>
               {exp.title} - {exp.years} years
             </li>
           ))}
         </ul>
       </div>
     );
   };
   ```

   I denne komponenten tar vi inn `name`, `age`, og `experience` som props og viser dem i en enkel HTML-struktur. `experience` er en array, så vi bruker `map`-funksjonen for å iterere over hvert element og vise det i en liste.

3. **Legg til PropTypes:**  
   Under komponenten, definer PropTypes for `Profile`. PropTypes er et bibliotek som lar oss spesifisere hvilke typer props en komponent skal motta. Dette hjelper med å fange feil tidlig i utviklingsprosessen.

   <details><summary>Se full kode</summary>
   
   ```javascript
   Profile.propTypes = {
     name: PropTypes.string.isRequired,
     age: PropTypes.number.isRequired,
     experience: PropTypes.arrayOf(
       PropTypes.shape({
         title: PropTypes.string.isRequired,
         years: PropTypes.number.isRequired,
       })
     ).isRequired,
   };
   ```

> [!IMPORTANT]  
> Her spesifiserer vi at `name` skal være en streng, `age` skal være et nummer, og `experience` skal være en array av objekter. Hvert objekt i `experience`-arrayen skal ha en `title` som er en streng og `years` som er et nummer. `isRequired` betyr at disse propsene er obligatoriske.

   Deretter, eksporter `Profile`-komponenten. Dette gjør at vi kan importere og bruke `Profile`-komponenten i andre deler av vår applikasjon.

   <details><summary>Se full kode</summary>
   
   ```javascript
   export default Profile;
   ```

**Forklaring:**

PropTypes gir typekontroll for props som sendes til en React-komponent. Dette bidrar til å fange feil tidligere i utviklingsprosessen. I denne oppgaven, ved å bruke PropTypes, sikrer vi at `Profile`-komponenten mottar riktige typer for `name`, `age` og `experience`. Dette bidrar til å forbedre robustheten og forutsigbarheten av komponenten.

> [!TIP]
> For `experience`, har vi brukt `arrayOf` kombinert med `shape` for å spesifisere at det er en array av objekter, hvor hvert objekt har bestemte nøkler med bestemte typer.

[React PropTypes and type checking](https://reactjs.org/docs/typechecking-with-proptypes.html)  
[PropTypes on GitHub](https://github.com/facebook/prop-types)


### **Oppgave 2: Integrering av TypeScript i et eksisterende React-prosjekt**

**Mål:** Integrer TypeScript i et eksisterende React JS-prosjekt for CV-applikasjonen.

**Beskrivelse:**  
Ta et eksisterende React JS-prosjekt for CV-applikasjonen og integrer TypeScript. Dette innebærer å installere nødvendige avhengigheter, konfigurere tsconfig, og endre noen av de eksisterende React JS-komponentene til TypeScript-komponenter.

**Link:** [Adding TypeScript to an Existing Project](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)

**Trinnvis Løsning:**

1. **Installer TypeScript og nødvendige avhengigheter:**  
   I terminalen, kjør følgende kommandoer. Dette vil installere TypeScript og typer for Node, React, React DOM, og Jest.

   <details><summary>Se full kode</summary>
   
   ```
   npm install --save typescript @types/node @types/react @types/react-dom @types/jest
   ```

2. **Initialiser en TypeScript konfigurasjonsfil:**  
   Kjør følgende kommando. Dette vil opprette en `tsconfig.json` fil i rotkatalogen av prosjektet, som brukes til å konfigurere TypeScript-kompilatoren.

   <details><summary>Se full kode</summary>
   
   ```
   npx tsc --init
   ```

3. **Konfigurer tsconfig for React:**  
   Åpne `tsconfig.json` og gjør følgende endringer. Dette konfigurerer TypeScript til å fungere med React og spesifiserer hvilke filer som skal inkluderes og ekskluderes.

   <details><summary>Se full kode</summary>
   
   ```json
   {
     "compilerOptions": {
       "target": "es5",
       "lib": ["dom", "dom.iterable", "esnext"],
       "allowJs": true,
       "skipLibCheck": true,
       "esModuleInterop": true,
       "allowSyntheticDefaultImports": true,
       "strict": true,
       "forceConsistentCasingInFileNames": true,
       "noFallthroughCasesInSwitch": true,
       "module": "esnext",
       "moduleResolution": "node",
       "resolveJsonModule": true,
       "isolatedModules": true,
       "noEmit": true,
       "jsx": "react-jsx"
     },
     "include": ["src/**/*.ts", "src/**/*.tsx"],
     "exclude": ["node_modules"]
   }
   ```

> [!NOTE]  
> Sørg for at `include` og `exclude` feltene er riktig konfigurert for å inkludere alle TypeScript-filer i `src`-mappen og ekskludere `node_modules`.

4. **Endre filendelser fra `.js` til `.tsx` for React-komponenter:**  
   Dette signaliserer til TypeScript kompileren at filene inneholder JSX. JSX er en syntaksutvidelse for JavaScript som ligner på HTML og brukes i React.

5. **Migrer en React-komponent til TypeScript:**  
   Som et eksempel, la oss ta `Profile`-komponenten fra Oppgave 1. Endre filendelsen til `.tsx` og deretter importer `React` som:

   <details><summary>Se full kode</summary>
   
   ```typescript
   import React, { FC } from 'react';
   ```

   Deretter, definer prop-typer for `Profile`. I TypeScript bruker vi grensesnitt (interfaces) for å definere typer for props.

   <details><summary>Se full kode</summary>
   
   ```typescript
   interface ProfileProps {
     name: string;
     age: number;
     experience: {
       title: string;
       years: number;
     }[];
   }

   const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
     return (
       <div>
         <h2>{name}</h2>
         <p>Age: {age}</p>
         <ul>
           {experience.map((exp, index) => (
             <li key={index}>
               {exp.title} - {exp.years} years
             </li>
           ))}
         </ul>
       </div>
     );
   };

   export default Profile;
   ```

**Forklaring:**

Å legge til TypeScript i et eksisterende React JS-prosjekt gir sterkere type sikkerhet og kan forbedre kodekvaliteten. Den første delen av denne oppgaven fokuserer på oppsett og installasjon av nødvendige avhengigheter. `tsconfig.json` konfigurerer hvordan TypeScript kompileren skal fungere. 

> [!CAUTION]
> Sørg for å teste applikasjonen grundig etter å ha migrert til TypeScript for å sikre at ingen funksjonalitet er brutt.

De siste trinnene demonstrerer en enkel migrasjon av en React-komponent til TypeScript ved å bruke grensesnitt for props og `FC` (Functional Component) fra `React`.

[Adding TypeScript to an Existing Project](https://www.typescriptlang.org/docs/handbook/migrating-from-javascript.html)  
[TypeScript and React](https://fettblog.eu/typescript-react/)

### **Oppgave 3: Feilsøking i React-komponenter**

**Mål:** Forbedre feilsøkingsferdigheter ved å identifisere og rette feil i React-komponenter.

**Beskrivelse:**  
I denne oppgaven skal du finne og rette feil i en gitt React-komponent. Koden nedenfor er ment å vise en liste over brukere med navn og alder, men den inneholder en feil som forhindrer riktig visning. Din oppgave er å finne og rette feilen.

**Link:** [React Documentation](https://reactjs.org/docs/getting-started.html)

**Kode:**

<details><summary>Se full kode</summary>

```javascript
import React from 'react';

const UserList = ({ users }) => {
  return (
    <div>
      <h1>User List</h1>
      <ul>
        {users.map(user => (
          <li key={user.id}>
            {user.name} - {user.age} years old
          </li>
        ))}
      </ul>
    </div>
  );
};

UserList.propTypes = {
  users: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      name: PropTypes.string.isRequired,
      age: PropTypes.number.isRequired,
    })
  ).isRequired,
};

export default UserList;
```

**Forklaring:**

Koden ovenfor skal vise en liste over brukere med navn og alder. Hver bruker har en unik `id`, et `name`, og en `age`. Komponentens props er typekontrollert med PropTypes for å sikre at `users` er en array av objekter med de nødvendige feltene.

**Løsningsforslag:**

Feilen i koden er at `PropTypes` ikke er importert, noe som vil føre til en feil når komponenten prøver å bruke `PropTypes` for typekontroll. For å rette feilen, må vi importere `PropTypes` fra `prop-types`-biblioteket.

<details><summary>Se full kode</summary>

```javascript
import React from 'react';
import PropTypes from 'prop-types';

const UserList = ({ users }) => {
  return (
    <div>
      <h1>User List</h1>
      <ul>
        {users.map(user => (
          <li key={user.id}>
            {user.name} - {user.age} years old
          </li>
        ))}
      </ul>
    </div>
  );
};

UserList.propTypes = {
  users: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      name: PropTypes.string.isRequired,
      age: PropTypes.number.isRequired,
    })
  ).isRequired,
};

export default UserList;
```

Ved å legge til `import PropTypes from 'prop-types';` øverst i filen, sikrer vi at `PropTypes` er tilgjengelig for komponenten, og typekontrollen vil fungere som forventet.



### **Oppgave 5: Feilsøking i TypeScript**

**Mål:** Lære å identifisere og rette opp feil i TypeScript-kode.

**Beskrivelse:**  
I denne oppgaven skal du feilsøke en `Profile`-komponent som er skrevet i TypeScript. Koden har en feil som forhindrer den fra å fungere som forventet. Din oppgave er å finne og rette opp feilen. Koden skal vise brukerens navn, alder og arbeidserfaring.

**Link:** [TypeScript Error Handling](https://www.typescriptlang.org/docs/handbook/basic-types.html)

1. **Åpne `Profile`-komponenten:**  
   Gå til filen hvor `Profile`-komponenten ligger. Filen skal ha endelsen `.tsx`.

> [!NOTE]  
> I TypeScript, bruker vi `.tsx`-filer for React-komponenter som inneholder JSX. Dette gjør at vi kan dra nytte av TypeScript sine typer samtidig som vi skriver JSX-syntaks.

2. **Se gjennom koden og identifiser feilen:**  
   Her er koden for `Profile`-komponenten:

   <details><summary>Se full kode</summary>
   
   ```typescript
   import React, { FC } from 'react';

   interface ProfileProps {
     name: string;
     age: number;
     experience: {
       title: string;
       years: number;
     }[];
   }

   const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
     return (
       <div>
         <h1>{name}</h1>
         <p>Age: {age}</p>
         <ul>
           {experience.map((exp, index) => (
             <li key={index}>
               {exp.title} - {exp.years} years
             </li>
           ))}
         </ul>
       </div>
     );
   };

   export default Profile;
   ```

   **Forklaring:**  
   Koden ovenfor skal vise brukerens navn, alder og arbeidserfaring. Arbeidserfaringen er en liste av objekter som inneholder `title` og `years`.

3. **Finn og rett opp feilen:**  
   Identifiser feilen i koden og rett den opp. 

**Løsningsforslag:**  
Feilen i koden er at `experience`-prop ikke blir sendt inn i riktig format. Her er den korrigerte koden:

<details><summary>Se full kode</summary>

```typescript
import React, { FC } from 'react';

interface ProfileProps {
  name: string;
  age: number;
  experience: {
    title: string;
    years: number;
  }[];
}

const Profile: FC<ProfileProps> = ({ name, age, experience }) => {
  return (
    <div>
      <h1>{name}</h1>
      <p>Age: {age}</p>
      <ul>
        {experience.map((exp, index) => (
          <li key={index}>
            {exp.title} - {exp.years} years
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Profile;
```


**Forklaring:**  
Etter å ha rettet opp feilen, vil `Profile`-komponenten nå vise brukerens navn, alder og arbeidserfaring korrekt. Sørg for at dataene som sendes inn som props samsvarer med `ProfileProps`-grensesnittet.

</details>

</br>

**Oppsummering:**

Feilsøking er en viktig ferdighet i utvikling, spesielt når du jobber med TypeScript og React. Ved å identifisere og rette opp feil i koden, kan du sikre at komponentene dine fungerer som forventet og gir en god brukeropplevelse. TypeScript hjelper med å fange opp mange feil tidlig i utviklingsprosessen, noe som kan spare tid og redusere frustrasjon.

[TypeScript Error Handling](https://www.typescriptlang.org/docs/handbook/basic-types.html)  
[React and TypeScript: Props](https://fettblog.eu/typescript-react/props/)



### **Oppgave 5: Bruk av Type Assertions**

**Mål:** Forstå hvordan og når du skal bruke type assertions i TypeScript.

**Beskrivelse:**  
I CV-applikasjonen, opprett en hjelpefunksjon `parseUserData` som tar en streng (JSON format) og konverterer den til et objekt. Bruk type assertions for å forsikre TypeScript at den returnerte verdien er av en spesifikk type (f.eks. `UserProfile` type).

**Link:** [TypeScript Type Assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)

**Trinnvis Løsning:**

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `UserProfile.ts`.

2. **Definer et grensesnitt for brukerprofildata:**  

   ```typescript
   interface UserProfile {
     name: string;
     age: number;
     experience: { title: string; years: number }[];
   }
   ```

3. **Opprett funksjonen `parseUserData`:**  

   ```typescript
   const parseUserData = (jsonData: string): UserProfile => JSON.parse(jsonData) as UserProfile;
   ```

**Forklaring:**

Funksjonen `parseUserData` konverterer en JSON-streng til et objekt. Ved bruk av type assertions (i dette tilfellet `as UserProfile`), forsikrer vi TypeScript om at det returnerte objektet matcher grensesnittet `UserProfile`.

Dette er nyttig når vi vet hvilken form dataen vil ha, selv om TypeScript ikke automatisk kan dedusere det. Type assertions tillater oss å spesifikt 'fortelle' TypeScript hvilken type en verdi er, forutsatt at vi vet mer enn TypeScript om den aktuelle verdien.

Merk: Mens type assertions kan være kraftige, bør de brukes varsomt. Å forsikre TypeScript feilaktig om en types form kan føre til uventede feil som er vanskelige å feilsøke.

[TypeScript Type Assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)  
[Assert function argument is a certain type in TypeScript](https://stackoverflow.com/questions/40081332/assert-function-argument-is-a-certain-type-in-typescript)


### **Oppgave 6: Union Typer og Literal Typer**

**Mål:** Utforske hvordan union typer og literal typer kan være nyttige i CV-applikasjonen.

**Beskrivelse:**  
Lag en komponent `Filter` i CV-applikasjonen som lar brukere filtrere jobberfaring basert på jobbtittel eller årstall. Denne komponenten skal ha en prop som bestemmer hvilken type filter den skal bruke. Bruk union typer for å definere denne propen som enten en streng (jobbtittel) eller et nummer (årstall). Bruk også literal typer for å sikre at den aksepterte strengen er en av forhåndsdefinerte jobbtitler.

**Link:** [TypeScript Union and Literal Types](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html)

**Trinnvis Løsning:**

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `Filter.tsx`.

2. **Definer typer for filtrering:**  

   ```typescript
   type JobTitle = 'Developer' | 'Designer' | 'Manager';
   type FilterType = string | number;
   ```

3. **Opprett Filter-komponenten:**  

   ```typescript
   interface FilterProps {
     filterBy: FilterType;
   }

   const Filter: React.FC<FilterProps> = ({ filterBy }) => {
     if (typeof filterBy === 'string') {
       // Filtrer etter jobbtittel
       return <div>Filtering by job title: {filterBy}</div>;
     } else if (typeof filterBy === 'number') {
       // Filtrer etter årstall
       return <div>Filtering by year: {filterBy}</div>;
     } else {
       return null;
     }
   };
   ```

**Forklaring:**

Vi starter med å definere `JobTitle` som en literal type. Dette betyr at den kan være en av tre strenger: 'Developer', 'Designer', eller 'Manager'. Vi definerer deretter `FilterType` som en union type, noe som betyr at den kan være enten en `string` eller et `number`.

I `Filter`-komponenten bruker vi type-sjekker (`typeof filterBy === 'string'`) for å avgjøre hvordan vi skal filtrere, basert på om `filterBy` er en streng eller et nummer. Denne tilnærmingen utnytter kraften av TypeScript for å sørge for at koden vår er type-sikker og gir forventet oppførsel basert på hvilken type data som sendes til komponenten.

Union og literal typer i TypeScript gir fleksibilitet i definisjonen av variable typer, samtidig som de gir sterk typesikkerhet.

[TypeScript Union and Literal Types](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html)  
[Practical TypeScript: Union and Intersection Types](https://dzone.com/articles/practical-typescript-union-and-intersection-types)


## Ekstra utfordringsoppgaver:

### **Oppgave 7: Generiske Typer**

**Mål:** Utforske dypere bruken av generiske typer i TypeScript.

**Beskrivelse:**  
Lag en generisk funksjon `getDetails` som tar en array av objekter og en nøkkel som en streng. Denne funksjonen skal returnere en ny array med verdiene tilhørende den nøkkelen fra hvert objekt. For eksempel, hvis den mottar en array av jobberfaringer og nøkkelen 'jobTitle', skal den returnere en array av jobbtitlene.

**Link:** [TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)

**Trinnvis Løsning:**

1. **Opprett en ny fil:**  
   Lag en ny fil kalt `Utilities.ts`.

2. **Definer en generisk funksjon:**  

   ```typescript
   const getDetails = <T, K extends keyof T>(items: T[], key: K): T[K][] => items.map(item => item[key]);
   ```

3. **Eksempel på bruk:**  

   ```typescript
   const jobExperiences = [
     { jobTitle: 'Developer', year: 2020 },
     { jobTitle: 'Designer', year: 2019 },
   ];

   const jobTitles = getDetails(jobExperiences, 'jobTitle'); // ['Developer', 'Designer']
   ```

**Forklaring:**

I denne oppgaven har vi laget en generisk funksjon ved navn `getDetails` som returnerer detaljer fra en gitt nøkkel for hvert objekt i en array. 

Den første generiske typen, `T`, representerer en hvilken som helst type. Den andre generiske typen, `K`, er begrenset til å være en nøkkel av `T` ved hjelp av `extends keyof T`.

Ved å kalle `getDetails` med `jobExperiences`-arrayen og nøkkelen 'jobTitle', får vi en ny array som inneholder kun jobbtitlene fra `jobExperiences`.

Generiske typer tillater deg å lage fleksible funksjoner og komponenter som kan håndtere mange forskjellige datatyper samtidig som de gir type-sikkerhet.

[TypeScript Handbook: Generics](https://www.typescriptlang.org/docs/handbook/generics.html)  
[Understanding TypeScript Generics](https://www.tutorialsteacher.com/typescript/typescript-generics)


