<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Event
 *
 * @ORM\Table(name="event", indexes={@ORM\Index(name="event-location", columns={"_locationId"}), @ORM\Index(name="event-category", columns={"_categoryId"}), @ORM\Index(name="event-contest", columns={"_contestId"}), @ORM\Index(name="event-teamida", columns={"_teamIdA"}), @ORM\Index(name="event-scoreteama", columns={"_scoreTeamA"}), @ORM\Index(name="event-teamidb", columns={"_teamIdB"}), @ORM\Index(name="event-scoreteamb", columns={"_scoreTeamB"})})
 * @ORM\Entity
 */
class Event
{
    /**
     * @var int
     *
     * @ORM\Column(name="eventId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $eventid;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="eventDate", type="datetime", nullable=false)
     */
    private $eventdate;

    /**
     * @var string|null
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $name = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="imageUrl", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $imageurl = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="note", type="text", length=65535, nullable=true, options={"default"="NULL"})
     */
    private $note = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="scoreTeamA", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $scoreteama = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="scoreTeamB", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $scoreteamb = 'NULL';

    /**
     * @var \Category
     *
     * @ORM\ManyToOne(targetEntity="Category")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_categoryId", referencedColumnName="categoryId")
     * })
     */
    private $categoryid;

    /**
     * @var \Team
     *
     * @ORM\ManyToOne(targetEntity="Team")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_teamIdA", referencedColumnName="teamId")
     * })
     */
    private $teamida;

    /**
     * @var \Team
     *
     * @ORM\ManyToOne(targetEntity="Team")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_teamIdB", referencedColumnName="teamId")
     * })
     */
    private $teamidb;

    /**
     * @var \Contest
     *
     * @ORM\ManyToOne(targetEntity="Contest")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_contestId", referencedColumnName="contestId")
     * })
     */
    private $contestid;

    /**
     * @var \Location
     *
     * @ORM\ManyToOne(targetEntity="Location")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_locationId", referencedColumnName="locationId")
     * })
     */
    private $locationid;

    public function getEventid(): ?int
    {
        return $this->eventid;
    }

    public function getEventdate(): ?\DateTimeInterface
    {
        return $this->eventdate;
    }

    public function setEventdate(\DateTimeInterface $eventdate): self
    {
        $this->eventdate = $eventdate;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getImageurl(): ?string
    {
        return $this->imageurl;
    }

    public function setImageurl(?string $imageurl): self
    {
        $this->imageurl = $imageurl;

        return $this;
    }

    public function getNote(): ?string
    {
        return $this->note;
    }

    public function setNote(?string $note): self
    {
        $this->note = $note;

        return $this;
    }

    public function getScoreteama(): ?int
    {
        return $this->scoreteama;
    }

    public function setScoreteama(?int $note): self
    {
        $this->scoreteama = $scoreteama;

        return $this;
    }

    public function getScoreteamb(): ?int
    {
        return $this->scoreteamb;
    }

    public function setScoreteamb(?int $note): self
    {
        $this->scoreteamb = $scoreteamb;

        return $this;
    }

    public function getCategoryid(): ?Category
    {
        return $this->categoryid;
    }

    public function setCategoryid(?Category $categoryid): self
    {
        $this->categoryid = $categoryid;

        return $this;
    }

    public function getTeamida(): ?Team
    {
        return $this->teamida;
    }

    public function setTeamida(?Team $teamid): self
    {
        $this->teamida = $teamid;

        return $this;
    }

    public function getTeamidb(): ?Team
    {
        return $this->teamidb;
    }

    public function setTeamidb(?Team $teamid): self
    {
        $this->teamidb = $teamid;

        return $this;
    }

    public function getContestid(): ?Contest
    {
        return $this->contestid;
    }

    public function setContestid(?Contest $contestid): self
    {
        $this->contestid = $contestid;

        return $this;
    }

    public function getLocationid(): ?Location
    {
        return $this->locationid;
    }

    public function setLocationid(?Location $locationid): self
    {
        $this->locationid = $locationid;

        return $this;
    }


}
