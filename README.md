<h1> CODEBASE FOR WAX </h1>

-Only code (gml and shader files) from the project are uploaded here, thus making it dead code that exists solely for evaluating purposes.
 
-None of the actual game assets will ever be uploaded here.

-There are several dead functions with inconsistent casing that will be removed from the main project.

-the current casing for the project is snake_case for scripts and snake_camelCase for the rest of resources.

The idea behind this project is to make a game solely by myself. This means no extensions, and no libraries (besides the huge help that is Game Maker Studio: 2) and certainly no copied code. With this in mind i just wanted to see how far it could go. To this day i've got a working lighting day/night cycle, a tile-based hyper-light collision system, an entirely personal state management system and several different defined gml coding styles.

<h3>TODO:</h3>
<ul>
  <li>internal level editor (Game Maker's level editor is starting to become annoying to use, especially tile editing).</li>
  <li>better cutscene handling.</li>
  <li>depth-sorting changes (layer based instead of depth and singleton based).</li>
  <li>lua interpreter(?).</li>
  <li>better input handling (lightweight object based, so that an AI can control it)</li>
<ul>

<h2>The most important parts for every folder:</h2>
</div>
 <h3> objects: </h3> 
  <ul>
   <li> obj_ambientManager </li>
   <li> obj_heightMap </li>
   <li> obj_mainMenu </li>
   <li> Wax </li>
  </ul>
  <h3> shaders: </h3>
   <ul>
    <li> sh_lightEngine </li>
    <li> sh_vignette </li>
    <li> sh_forcedPalette </li>
   </ul>
  <h3> scripts: </h3>
   <ul>
    <li> fsm_* </li>
    <li> wax_* </li>
    <li> pragma* </li>
    <li> ambient_draw_lighting </li>
    <li> sword_* </li>
    <li> lw_* </li>
    <li> tile_* </li>
    <li> collison* </li>
    <li> collide* </li>
   </ul>
  
