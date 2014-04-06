-- Particle Candy Creation Code
-- To be used with "Kwik" Photoshop Plugin  to create CoronaSDK Apps
-- Works with CoronaSDK build 2014.2189 or newer and Kwik version 3
-- By Hector Sanchez Perez
--@Appresario
-- April 2014

-- **** IMPORTANT***
--- Remember to Add the Particle Library (lib_particle_candy.lua" as external library in Kwik
--- and name it "Particles". You can buy it from http://x-pressive.com/ParticleCandy_Corona/
--
-- Also, please add this file (pcCreation.lua) as External Code after the creation of Layers
   
   

----------------------------------------------------------------------------------
-- STEP1.- CREATE AN EMITTER (NAME, SCREENW, SCREENH, ROTATION, ISVISIBLE, LOOP)
-- This creates an emitter called “E1″, setting its original position to the same 
-- position of layer “layer.rocket” (x and y), 0 sets the direction/angle of the 
-- emission, false makes the emitter sign invisible and true sets a forever 
-- loop for the emission)
----------------------------------------------------------------------------------
Particles.CreateEmitter("E1", layer.rocket.x, layer.rocket.y, 0, false, true)
 
 
 ---------------------------------------------------------------------------------
 --STEP 2.- ADD EMITTER TO SCENEGROUP
 -- Here, we add the emitter inside the current page group (sceneGroup),
 -- this way, when we change pages, it will be removed with the other objects in the page
 ---------------------------------------------------------------------------------
 local MyEmitter = Particles.GetEmitter("E1") --Emitter Handle. Remember to set it to "nil" before deleting it
 sceneGroup:insert(MyEmitter) 
 
 
  ------------------------------------------------------------------------------------
  -- STEP 3.- DEFINE PARTICLE TYPE PROPERTIES
  --–Lot’s of parameters for a particle, right? the important line here is the imagePath one,
  --where we set the path for the image being used in the emitter (in this case, it points to
  -- p1_bullet.png, which contains the rocket bullet from layer.rocket)

  -- Note: You can also use any of the settings from the Particle Candy samples, just
  -- remember to manually add the images to the "images" folder in the Corona Project
  ------------------------------------------------------------------------------------
  local particleProperties 		= {
      imagePath           = composer.imgDir.."p1_bullet.png",
      imageWidth          =  44,
      imageHeight         =  40,
      velocityStart       =  150,
      autoOrientation     =  true,
      killOutsideScreen   =  true,
      lifeTime            =  3000,
      alphaStart          =  0,
      fadeInSpeed         =  0.5,
      fadeOutSpeed        =  -0.75,
      fadeOutDelay        =  1500
  }

--------------------------------------------------------------
-- STEP 4.- CREATE THE ACTUAL PARTICLE TYPE
Particles.CreateParticleType ("Test1", particleProperties)
-------------------------------------------------------------

------------------------------------------------------------------------------------
-- STEP 5.- FEED EMITTERS (EMITTER NAME, PARTICLE TYPE NAME, EMISSION RATE, DURATION, DELAY)
------------------------------------------------------------------------------------
Particles.AttachParticleType("E1", "Test1", 5, 99999,0)


-------------------------------------------------------------------------------------------------
-- STEP 6.- MAKE PARTICLE FOLLOW AN OBJECT
-- Use this command to let an emitter automatically follow another object (the target)
-- Note that the emitter will only follow the object while emitting particles. If the
-- emitter is inactive, it will keep it's current position. This is a performance optimization.
--
-- Particles.SetEmitterTarget("name", TargetHandle, autoRotate, rotationOffset, xOffset, yOffset)
--
-- To untie both objects again, simply use this command again wihtout a target handle
-- ie: Particles.SetEmitterTarget("MyEmitter", nil) 
-------------------------------------------------------------------------------------------------
    
Particles.SetEmitterTarget("E1", layer.rocket, true, 0, 0, -80)


------------------------------------------------------------------------------------------
-- STEP 7.- TRIGGER THE EMITTERS
-- StartEmitter( "name", [oneShotEmission] )
--    name	(String) An emitter's unique name.
--    oneShotEmission	(Boolean) Optional, default false. If true, the emitter will not emit
-- the particles over time (as usual), it will fire them all at once within a single frame. 

-- Usually triggered by an "Action" or a Button in Kwik
--------------------------------------------------------------------------------------------
--Particles.StartEmitter("E1")
--Particles.StartAutoUpdate()


------------------------------------------------------------------------------------
--  STEP 8.- STOP EMITTER
--  Stops and resets an emitter. 

--- Usually triggered by an "Action" or a Button in Kwik
------------------------------------------------------------------------------------
--Particles.StopEmitter("E1")


------------------------------------------------------------------------------------
--  STEP 9.- DELETE EMITTER
--  Deletes an emitter. 
--  **** IMPORTANT NOTE! ----
-- If you stored any emitter handles using GetEmitter(), you must set these references
-- to the emitters to "nil" before you delete the emitters. Otherwise, they cannot be
-- garbage collected and will remain in memory! So be careful when storing emitter
-- handles on your own! 

--- Usually triggered by an "Action" or a Button in Kwik
------------------------------------------------------------------------------------

-- local MyEmitter = nil
--Particles.DeleteEmitter("E1")


--- NOTE: --------------------------------------------------------------------
-- if you want to delte ALL emmitters used this line of code instead of just
-- deleting one emitter at a time
--
-- Usually triggered by an "Action" or a Button in Kwik
-------------------------------------------------------------------------------
--Particles.CleanUp()

  