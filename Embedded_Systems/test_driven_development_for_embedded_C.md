# Test-Driven Development for Embedded C #
1. I am a programmer and I write bugs
2. Requirements are done when we discontinue support for project
	1. Waterfall does not work unless for simplest systems
		1. Don't put tests to the end
3. The systems bible - John Gall
	1. Program has bugs and will surprise you later
4. If development is followed by tests, then it leaves system with bugs
	1. Debug later programming
		1. If we make a mistake, sometime later bug is discovered (few months or later)
		2. If we try to find the cause of the bug and it may take a long time
			1. Broken code might have been part of the system for a while
				1. System may be working due to off by one errors
		3. It may be easy to fix
			1. The fix might lead to other errors
5. Edgar Dijkstra's Vision
	1. "If you want more effective programmers, you will discover that they should not waste their time debugging, they should not introduce the bugs to start with."
		1. How?
			1. We can find an approximation?
6. Write a test

		TEST(Rtc, check20081231)
		{
			days = daysSince1980(2008, 366);
			CHECK(ConvertDays(days, &time);
			assertDate(WED, 2008, 12, 31);
		}
		
	1. This test could prevent bug
7. Test everything!
	1. Suppose 3 modules and has 10 paths through them
		1. 1000 tests if we have to test through all the paths (not practical unless it is critical)
		2. Solution: Unit tests
			1. 10 paths x 3 + handfull of integration tests
	2. Integration tests are needed to make sure all the connections are correct (parts of system can talk to each other)
8. Stop doing debug later programming
	1. Solution: TDD
		1. Write one test for a small behavior
		2. Test fails
			1. If doesn't fail, the function is already declared
		3. Make it pass
			1. Just enough code to pass new and all prior tests