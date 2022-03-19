/obj/item/cannon_parts
	name = "cannon parts"
	desc = "A collection of parts that can be used to build a cannon."
	icon = //put icon file here
	icon_state = //put icon state here
	inhand_image_icon = //put inhand icon file here
	flags = FPRINT | TABLEPASS | CONDUCT
	stamina_damage = 35
	stamina_cost = 22
	stamina_crit_chance = 10
	var/build_duration = 100

	proc/construct(mob/user as mob, turf/T as turf)

		if (!T)
			T = user ? get_turf(user) : get_turf(src)
			if (!T) // buh??
				return
        var/obj/cannon/new_cannon = new /obj/cannon/
        if (src.material)
            new_cannon.setMaterial(src.material)
        if (user)
            new_cannon.add_fingerprint(user)
            logTheThing("station", user, null, "builds \a cannon (<b>Material:</b> [new_cannon.material && new_cannon.material.mat_id ? "[new_cannon.material.mat_id]" : "*UNKNOWN*"]) at [log_loc(T)].")
            user.u_equip(src)
		qdel(src)
		return new_cannon

	attackby(obj/item/W as obj, mob/user as mob)
		if (iswrenchingtool(W))
			src.deconstruct(src.reinforced ? 1 : null)
			qdel(src)
		else
			return ..()

	attack_self(mob/user as mob)
		actions.start(new /datum/action/bar/icon/cannon_build(src, src.build_duration), user)

	disposing()
		if (src.contained_storage && length(src.contained_storage.contents))
			var/turf/T = get_turf(src)
			for (var/atom/movable/A in src.contained_storage)
				A.set_loc(T)
			var/obj/O = src.contained_storage
			src.contained_storage = null
			qdel(O)
		..()

/* -------------------- Cannon Actions -------------------- */
/datum/action/bar/icon/cannon_build
	id = "cannon_build"
	interrupt_flags = INTERRUPT_MOVE | INTERRUPT_ACT | INTERRUPT_STUNNED | INTERRUPT_ACTION
	duration = 100
	icon = 'icons/ui/actions.dmi'
	icon_state = "working"

	var/obj/item/cannon_parts/cparts
	var/fname = "cannon"

	New(var/obj/item/cannon_parts/cp, var/duration_i)
		..()
		cparts = cp
		if (duration_i)
			duration = duration_i
		if (ishuman(owner))
			var/mob/living/carbon/human/H = owner
			if (H.traitHolder.hasTrait("carpenter") || H.traitHolder.hasTrait("training_engineer"))
				duration = round(duration / 2)

	onUpdate()
		..()
		if (cparts == null || owner == null || get_dist(owner, cparts) > 1)
			interrupt(INTERRUPT_ALWAYS)
			return
		var/mob/source = owner
		if(istype(source))
			if (cparts != source.equipped())
				interrupt(INTERRUPT_ALWAYS)

	onStart()
		..()
		owner.visible_message("<span class='notice'>[owner] begins constructing a cannon!</span>")

	onEnd()
		..()
		owner.visible_message("<span class='notice'>[owner] constructs a cannon!</span>")
		fparts.construct(owner)

/datum/action/bar/icon/cannon_deconstruct
	id = "cannon_deconstruct"
	interrupt_flags = INTERRUPT_MOVE | INTERRUPT_STUNNED
	duration = 100
	icon = 'icons/ui/actions.dmi'
	icon_state = "working"

	var/obj/the_cannon
	var/obj/item/the_tool

	New(var/obj/O, var/obj/item/tool, var/duration_i)
		..()
		if (O)
			the_cannon = O
			place_to_put_bar = O
		if (tool)
			the_tool = tool
			icon = the_tool.icon
			icon_state = the_tool.icon_state
		if (duration_i)
			duration = duration_i
		if (ishuman(owner))
			var/mob/living/carbon/human/H = owner
			if (H.traitHolder.hasTrait("carpenter") || H.traitHolder.hasTrait("training_engineer"))
				duration = round(duration / 2)

	onUpdate()
		..()
		if (the_cannon == null || the_tool == null || owner == null || get_dist(owner, the_cannon) > 1)
			interrupt(INTERRUPT_ALWAYS)
			return
		var/mob/source = owner
		if (istype(source) && the_tool != source.equipped())
			interrupt(INTERRUPT_ALWAYS)

	onStart()
		..()
		playsound(the_cannon, "sound/items/Ratchet.ogg", 50, 1)
		owner.visible_message("<span class='notice'>[owner] begins disassembling the cannon.</span>")

	onEnd()
		..()
		playsound(the_cannon, "sound/items/Deconstruct.ogg", 50, 1)
		the_cannon:deconstruct() // yes a colon, bite me
		owner.visible_message("<span class='notice'>[owner] disassembles the cannon.</span>")

/obj/cannon
	name = "cannon"
	desc = "to do"//cannon description
	icon = //cannon icon file
	icon_state = //cannon icon state
	density = 1
	anchored = 1.0
	flags = NOSPLASH
	event_handler_flags = USE_FLUID_ENTER
	layer = OBJ_LAYER-0.1
	stops_space_move = TRUE
	welded = 0
	lit = 0

	//make cannon+ball at nano-fab
	//ability to withstand different powers dependent on material properties
	//cannonball damage based on material properties
	//erebite cannons explode, erebite cannonballs explode on impact (or in barrel if it is too weak)
	//power based on reagents in barrel
	//use paper for confetti instead
	//people can climb in
	//people wearing a helmet and clown mask take no damage themselves (define helmet as headgear with 2+ defense) (maybe just a chance)
	//plasmastone cannonballs explode into plasma gas on impact
	//shrapnel option? (crystal ball?)
	//viscerite ball explodes into gibs on impact (harmless)
	//if fail explodes just like the reagents would have (maybe just use that explosion, point is to make it not any stronger than just a beaker bomb)
	//reagent cap 100 or less (see above)
	//sorium work as well?

	//light calls fire if not extinguished
	//no action bar on light, instead show fuse shrinking on sprite
	//check explosion power of reagents, compare against resistance of cannon, then fire or just explode
	//put human inside projectile for powerful explosions, maybe just throw_at() for weak explosions
	//projectile breaks walls if strong enough

	attackby(obj/item/W as obj, mob/user as mob, params)
		//weld then wrench to deconstruct (wrench then weld to construct) (timer)
		//weld to secure (so it doesn't destory itself) (timer)
		//wrench to deconstruct unwelded (timer)
		//crowbar to rotate (timer)
		//canonball
		//reagents?
		//shrapnell?Paper?
		//light fuse
		if some condition //ready to be fired condition
			if (src.lit == 0)
				if (isweldingtool(W) && W:try_weld(user,0,-1,0,0))
					src.light(user, "<span class='alert'><b>[user]</b> lights [src] fuse with [W].</span>")
					return
				else if (istype(W, /obj/item/sword) && W:active)
					src.light(user, "<span class='alert'><b>[user]</b> expertly swishes [W] and lights [src] fuse ablaze.</span>")
					return
				else if (istype(W, /obj/item/clothing/head/cakehat) && W:on)
					src.light(user, "<span class='alert'><b>[user]</b> lights [src] fuse with [W].</span>")
					return
				else if (istype(W, /obj/item/device/igniter))
					src.light(user, "<span class='alert'><b>[user]</b> lights [src] fuse with [W].</span>")
					return
				else if (istype(W, /obj/item/device/light/zippo) && W:on)
					src.light(user, "<span class='alert'><b>[user]</b> lights [src] fuse with [W].</span>")
					return
				else if ((istype(W, /obj/item/match) || istype(W, /obj/item/clothing/mask/cigarette) || istype(W, /obj/item/device/light/candle)) && W:on)
					src.light(user, "<span class='alert'><b>[user]</b> lights [src] fuse with [W].</span>")
					return
				else if (W.burning)
					src.light(user, "<span class='alert'><b>[user]</b> lights [src] fuse with [W].</span>")
					return
				else if (W.firesource)
					src.light(user, "<span class='alert'><b>[user]</b> lights [src] with [W].</span>")
					W.firesource_interact()
					return
				else
					return ..()
		else
			return ..()

	proc/light(var/mob/user as mob, var/message as text)
		//add logging

	proc/fire()

	attack_hand(mob/user)
		//use this to put out a fuse

	Cross(atom/movable/mover)

	MouseDrop_T(atom/O, mob/user as mob)

	mouse_drop(atom/over_object, src_location, over_location)




/datum/action/bar/icon/table_tool_interact
	id = "table_tool_interact"
	interrupt_flags = INTERRUPT_MOVE | INTERRUPT_ACT | INTERRUPT_STUNNED | INTERRUPT_ACTION
	duration = 50
	icon = 'icons/ui/actions.dmi'
	icon_state = "working"

	var/obj/table/the_table
	var/obj/item/the_tool
	var/interaction = TABLE_DISASSEMBLE

	New(var/obj/table/tabl, var/obj/item/tool, var/interact, var/duration_i)
		..()
		if (tabl)
			the_table = tabl
		if (tool)
			the_tool = tool
			icon = the_tool.icon
			icon_state = the_tool.icon_state
		if (interact)
			interaction = interact
		if (duration_i)
			duration = duration_i
		if (ishuman(owner) && interaction != TABLE_LOCKPICK)
			var/mob/living/carbon/human/H = owner
			if (H.traitHolder.hasTrait("carpenter") || H.traitHolder.hasTrait("training_engineer"))
				duration = round(duration / 2)

	onUpdate()
		..()
		if (the_table == null || the_tool == null || owner == null || get_dist(owner, the_table) > 1)
			interrupt(INTERRUPT_ALWAYS)
			return
		var/mob/source = owner
		if (istype(source) && the_tool != source.equipped())
			interrupt(INTERRUPT_ALWAYS)
			return
		else if (interaction == TABLE_DISASSEMBLE && the_table.desk_drawer)
			if (the_table.desk_drawer.locked)
				boutput(owner, "<span class='alert'>You can't disassemble [the_table] when its drawer is locked!</span>")
				interrupt(INTERRUPT_ALWAYS)
				return
			else if (the_table.desk_drawer.contents.len)
				boutput(owner, "<span class='alert'>You can't disassemble [the_table] while its drawer has stuff in it!</span>")
				interrupt(INTERRUPT_ALWAYS)
				return
		else if (interaction == TABLE_LOCKPICK)
			if (!the_table.desk_drawer || !the_table.desk_drawer.locked)
				interrupt(INTERRUPT_ALWAYS)
				return
			else if (prob(8))
				owner.visible_message("<span class='alert'>[owner] messes up while picking [the_table]'s lock!</span>")
				playsound(the_table, "sound/items/Screwdriver2.ogg", 50, 1)
				interrupt(INTERRUPT_ALWAYS)
				return

	onStart()
		..()
		var/verbing = "doing something to"
		switch (interaction)
			if (TABLE_DISASSEMBLE)
				verbing = "disassembling"
				playsound(the_table, "sound/items/Ratchet.ogg", 50, 1)
			if (TABLE_WEAKEN)
				verbing = "weakening"
				playsound(the_table, "sound/items/Welder.ogg", 50, 1)
			if (TABLE_STRENGTHEN)
				verbing = "strengthening"
				playsound(the_table, "sound/items/Welder.ogg", 50, 1)
			if (TABLE_ADJUST)
				verbing = "adjusting the shape of"
				playsound(the_table, "sound/items/Screwdriver.ogg", 50, 1)
			if (TABLE_LOCKPICK)
				verbing = "picking the lock on"
				playsound(the_table, "sound/items/Screwdriver2.ogg", 50, 1)
		owner.visible_message("<span class='notice'>[owner] begins [verbing] [the_table].</span>")

	onEnd()
		..()
		var/verbens = "does something to"
		switch (interaction)
			if (TABLE_DISASSEMBLE)
				verbens = "disassembles"
				playsound(the_table, "sound/items/Deconstruct.ogg", 50, 1)
				the_table.deconstruct()
			if (TABLE_WEAKEN)
				verbens = "weakens"
				the_table.status = 1
			if (TABLE_STRENGTHEN)
				verbens = "strengthens"
				the_table.status = 2
			if (TABLE_ADJUST)
				verbens = "adjusts the shape of"
				the_table.set_up()
			if (TABLE_LOCKPICK)
				verbens = "picks the lock on"
				if (the_table.desk_drawer)
					the_table.desk_drawer.locked = 0
				playsound(the_table, "sound/items/Screwdriver2.ogg", 50, 1)
		owner.visible_message("<span class='notice'>[owner] [verbens] [the_table].</span>")
